# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Policies', type: :request do
  describe 'GET /policy/:id' do
    it 'returns full policy data' do
      insured = create(:insured)
      policy = create(:policy, insured: insured)
      vehicle = create(:vehicle, insured: insured)
      expected_response = policy.attributes.merge(
        insured: insured.attributes,
        vehicle: vehicle.attributes
      ).to_json

      get "/policies/#{policy.id}"

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq(expected_response)
    end
  end
end