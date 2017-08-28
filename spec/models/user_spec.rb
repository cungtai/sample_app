require "rails_helper"

RSpec.describe User, type: :model do


context "validates" do

  it{is_expected.to validate_presence_of :name}
  it{is_expected.to validate_presence_of :email}
  it{is_expected.to validate_presence_of :password}
  it{is_expected.to validate_presence_of :password_confirmation}

  it "is invalid with long name" do
    expect(FactoryGirl.build(:user, name: "a"*51)).not_to be_valid
  end

  it "is valid with valid name" do
    expect(FactoryGirl.build(:user, name: "a"*50)).to be_valid
  end


  it "is valid with valid email" do
    expect(FactoryGirl.build(:user, email: "abc@abc.com")).to be_valid
  end

  it "is invalid with invalid email" do
    expect(FactoryGirl.build(:user, email: "abcabc.com")).not_to be_valid
  end

  it do
    is_expected.to validate_length_of(:password)
      .is_at_least 6
  end

  it "is valid with valid name" do
    expect(FactoryGirl.build(:user, password: "a"*5)).not_to be_valid
  end
end

end
