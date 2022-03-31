require 'rails_helper'

describe "create user" do
  it "check validation on user creation" do
    build :user
  end
end