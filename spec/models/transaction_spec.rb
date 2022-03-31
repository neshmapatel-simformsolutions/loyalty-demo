require 'rails_helper'

describe Transaction do
  let (:user) { build :user }
  let (:product) { build :product }
  let (:currency) { build :currency }

  it "create valid transaction" do
    subject { create :transaction }
  end
end