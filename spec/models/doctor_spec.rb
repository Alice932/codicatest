# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe Doctor do
    before(:each) do
      @doctor = Doctor.new
    end

    it 'should be valid' do
      @doctor.should be_valid
    end
  end
end
