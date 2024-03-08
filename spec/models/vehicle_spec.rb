# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'validations' do
    subject { build(:vehicle) }

    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:make) }
    it { should validate_presence_of(:plate) }
    it { should validate_presence_of(:year) }

    it { should belong_to(:insured) }
  end
end
