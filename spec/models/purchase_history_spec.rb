require 'rails_helper'

RSpec.describe PurchaseHistory, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase_history)
  end

  it "user_idとitem_idが有れば購入ができること" do
    expect(@purchase).to be_valid
  end
end
