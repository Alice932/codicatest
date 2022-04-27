# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe Doctor do
    before(:each) do
      @doctor = Doctor.new({name: 'test', email: "test@test.test"})
    end

    subject { @doctor }

      it { should respond_to(:name) }
      it { should respond_to(:email) }

      it { should be_valid }
      describe "when email is not present" do
        before { @doctor.email = "Not valid.." }
        it { should_not be_valid }
      end
    end
end
