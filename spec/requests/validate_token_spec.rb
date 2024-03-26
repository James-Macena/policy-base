# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Validates authorization token', type: :request do
  describe 'in every request.' do
    before { allow(JWT).to receive(:decode).and_call_original }

    context 'When authorization token is provided' do
      let(:auth_token) do
        'eyJhbGciOiJIUzI1NiJ9.e30.AfRFW87RY0A8O8ou8vHdAxZ2o0XfGryPnaWeb3yUd-Y'
      end

      before do
        get policies_path, headers: {
          Authorization: "Bearer #{auth_token}"
        }
      end

      it 'does validate the token' do
        expect(response).not_to have_http_status(:unauthorized)
        expect(JWT).to have_received(:decode).with(
          auth_token, ENV.fetch('JWT_SECRET_KEY'),
          true, { algorithm: ENV.fetch('JWT_ALGORITHM') }
        )
      end

      context 'and authorization token is invalid' do
        let(:auth_token) { 'invalid.token' }
        it 'reurns unauthorized' do
          expect(response).to have_http_status(:unauthorized)
          expect(response.body).to eq('Invalid token')
        end
      end

      context 'and authorization token has an invalid signature' do
        let(:auth_token) do
          'eyJhbGciOiJIUzI1NiJ9.e30.' \
            'TEEyll2oVdU8T8v68hxx-m-Tou7fqxfrClp7zuYqNrY'
        end

        it 'reurns unauthorized' do
          expect(response).to have_http_status(:unauthorized)
          expect(response.body).to eq('Invalid token')
        end
      end
    end

    context 'When authorization token is not provided' do
      it 'reurns unauthorized' do
        get policies_path

        expect(response).to have_http_status(:unauthorized)
        expect(response.body).to eq('Invalid token')
      end
    end
  end
end
