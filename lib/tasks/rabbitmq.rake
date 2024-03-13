# frozen_string_literal: true

require_relative '../rabbitmq/rabbitmq_connection'

namespace :rabbitmq do
  task start_workers: :environment do
    rabbitmq_connection = RabbitmqConnection.new

    puts "Starting workers on #{ENV.fetch('RAILS_ENV')} environment"

    rabbitmq_connection.start_workers

    puts(
      '=== Workers are running ===',
      'Use Ctrl-C to stop'
    )

    trap('INT') do
      puts "\nGracefully stopping workers..."

      rabbitmq_connection.stop_workers

      puts 'Exiting...'
      exit
    end

    loop { sleep }
  end
end
