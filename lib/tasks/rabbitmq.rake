# frozen_string_literal: true

namespace :rabbitmq do
  task start_workers: :environment do
    RabbitmqConnection.start_workers
  rescue Interrupt
    RabbitmqConnection.close
  end
end
