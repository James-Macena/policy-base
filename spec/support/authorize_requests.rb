# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each, type: :request) do
    allow(JWT).to receive(:decode).and_return(spy)
  end
end
