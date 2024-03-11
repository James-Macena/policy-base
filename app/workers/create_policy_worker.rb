# frozen_string_literal: true

class CreatePolicyWorker
  QUEUE_NAME = 'policy-api.create-policy'

  attr_reader :channel, :queue

  def initialize(channel)
    @channel = channel
    @queue = @channel.queue(QUEUE_NAME, durable: true)
  end

  def work
    queue.subscribe(manual_ack: true, block: true) do |delivery_info, _properties, message|
      process_message(message, delivery_info)
    end
  end

  private

  def process_message(message, delivery_info)
    puts "Started processing message: #{message}"

    policy_data = JSON.parse(message).deep_symbolize_keys

    ActiveRecord::Base.transaction do
      insured = Insured.create!(policy_data[:insured])
      insured.create_policy!(validity: policy_data[:validity])
      insured.create_vehicle!(policy_data[:vehicle])
    end

    puts 'done processing message'
    ack!(delivery_info)
  end

  def ack!(delivery_info)
    channel.ack(delivery_info.delivery_tag)
  end
end
