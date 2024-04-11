# frozen_string_literal: true

class PaymentsController < ApplicationController
  def stripe_config
    render json: {
      publishable_key: ENV.fetch('STRIPE_PUBLISHABLE_KEY')
    }
  end
end
