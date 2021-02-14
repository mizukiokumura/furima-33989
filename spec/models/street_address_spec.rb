require 'rails_helper'

RSpec.describe StreetAddress, type: :model do
  before do
    @address = FactoryBot.build(:street_address)
  end
end
