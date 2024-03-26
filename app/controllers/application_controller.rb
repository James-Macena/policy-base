# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :validate_token

  private

  def validate_token
    user_token = request.headers['Authorization']

    JWT.decode(
      user_token&.gsub('Bearer ', ''),
      ENV.fetch('JWT_SECRET_KEY'), true,
      { algorithm: ENV.fetch('JWT_ALGORITHM') }
    )
  rescue JWT::VerificationError, JWT::DecodeError
    render status: 401, body: 'Invalid token'
  end
end
