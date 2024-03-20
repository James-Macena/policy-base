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

      get policy_path(id: policy.id)

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq(expected_response)
    end

    context 'when policy is not found' do
      it 'returns not found status' do
        get policy_path(id: '1')

        expect(response).to have_http_status(:not_found)
        expect(response.body).to be_blank
      end
    end
  end

  describe 'GET /policies' do
    it 'returns a list of policies' do
      insured = create(:insured)
      policy = create(:policy, insured: insured)
      vehicle = create(:vehicle, insured: insured)
      expected_response = policy.attributes.merge(
        insured: insured.attributes,
        vehicle: vehicle.attributes
      )

      get policies_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq([expected_response].to_json)
    end

    context 'when policy is not found' do
      it 'returns not found status' do
        get policies_path

        expect(response).to have_http_status(:not_found)
        expect(response.body).to be_blank
      end
    end
  end
end
