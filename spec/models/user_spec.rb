require "rails_helper"

RSpec.describe User, :type => :model do
  context "invalid attributes" do
    it "is invalid without a username" do
      user = User.new(email_address: "example@example.com", password_digest: "password")
      expect(user).to_not be_valid
    end

    it "is invalid without a password" do
      user = User.new(email_address: "example@example.com", username: "example")
      expect(user).to_not be_valid
    end

    it "is invalid without an email address" do
      user = User.new(username: "example", password_digest: "password")
      expect(user).to_not be_valid
    end

    it "is invalid with a duplicate username" do
      valid_user = User.create(email_address: "example@example.com", username: "example", password_digest: "password")
      invalid_user = User.new(email_address: "different@example.com", username: "example", password_digest: "different")
      expect(invalid_user).to_not be_valid
    end

    it "is invalid with a duplicate email address" do
      valid_user = User.create(email_address: "example@example.com", username: "example", password_digest: "password")
      invalid_user = User.new(email_address: "example@example.com", username: "different", password_digest: "different")
      expect(invalid_user).to_not be_valid
    end
  end

  it "is given a role of 'user' by default" do
    user = User.create(email_address: "example@example.com", username: "example", password_digest: "password")
    expect(user.role).to eq("user")
  end
end










#assert password
#assert email unique
#assert username unique
#assert password contains a number
#assert default role or can be admin
#