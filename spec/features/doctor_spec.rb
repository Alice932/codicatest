require 'rails_helper'

RSpec.feature "Doctors", type: :feature do
  let(:doctor) { create(:user, :doctor) }

end
