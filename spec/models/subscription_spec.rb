require "rails_helper"

RSpec.describe Subscription, type: :model do
  it "name・price・payment_day があれば有効" do
    user = User.create!(email: "test@example.com", password: "password")
    subscription = Subscription.new(
      name: "Netflix",
      price: 1000,
      payment_day: 10,
      user: user
    )
    expect(subscription).to be_valid
  end

  it "name が空だと無効" do
    subscription = Subscription.new(name: "", price: 1000, payment_day: 10)
    expect(subscription).to be_invalid
  end

  it "price が空だと無効" do
    subscription = Subscription.new(name: "Netflix", price: nil, payment_day: 10)
    expect(subscription).to be_invalid
  end

  it "payment_day が 31 を超えると無効" do
    subscription = Subscription.new(name: "Netflix", price: 1000, payment_day: 32)
    expect(subscription).to be_invalid
  end

end