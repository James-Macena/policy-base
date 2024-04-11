# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Payments', type: :request do
  describe 'GET /payments/stripe_config' do
    it 'returns stripe publishasble key' do
      get stripe_config_path
      symbolized_body = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(symbolized_body).to eq({
        publishable_key: ENV.fetch('STRIPE_PUBLISHABLE_KEY')
      })
    end
  end
end
