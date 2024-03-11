# frozen_string_literal: true

class RabbitmqConnection
  Workers = ['CreatePolicyWorker'].freeze

  def self.create_channel
    @@connection = Bunny.new(hostname: 'rabbitmq')
    @@connection.start
    @@channel = @@connection.create_channel
  end

  def self.connection
    @@connection
  end

  def self.channel
    @@channel
  end

  def self.start_workers
    create_channel

    Workers.each { |worker_class| worker_class.constantize.new(channel).work }
  end

  def self.close
    at_exit do
      channel.close
      connection.close
    end
  end
end
