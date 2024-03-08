# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Policy, type: :model do
  describe 'validations' do
    subject { build(:policy) }

    it { should validate_presence_of(:validity) }

    it { should belong_to(:insured) }
    it { should have_one(:vehicle) }
  end
end
