# frozen_string_literal: true

class RabbitmqConnection
  WORKERS = ['CreatePolicyWorker'].freeze

  attr_reader :connection, :channel

  def initialize
    @connection = Bunny.new(hostname: ENV.fetch('RABBITMQ_HOST'))
    @connection.start
    @channel = @connection.create_channel
  end

  def start_workers
    WORKERS.each do |worker_class|
      Thread.new do
        worker_class.constantize.new(channel).work
      end
    end
  end

  def stop_workers
    at_exit do
      channel.close
      connection.close
    end
  end
end
