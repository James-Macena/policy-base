# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Insured, type: :model do
  describe 'validations' do
    subject { build(:insured) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:document_number) }
    it { should validate_presence_of(:document_type) }

    it { should have_one(:policy) }
    it { should have_one(:vehicle) }
  end
end
