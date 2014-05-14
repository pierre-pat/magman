require 'spec_helper'

describe User do

  before { @user = User.new(name: "user1", email: "user1@example.com",
                                                  password: "secret1", password_confirmation: "secret1") }
  subject { @user }

  describe 'It should respond to its fields' do
    it { should respond_to(:name) }
    it { should respond_to(:email) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:password_digest) }
  end

  describe 'should be valid when all required fields are set' do
    it { should be_valid}
  end

  describe 'should not be valid when 1 required field is missing' do
    before { @user.name = nil }
    it {should_not be_valid }

    before do
      @user.name = "name1"
      @user.email = nil
    end
    it {should_not be_valid }

    before do
      @user.email = "email1"
      @user.password = nil
    end
    it {should_not be_valid }

    before do
      @user.password = "password1"
      @user.password_confirmation = nil
    end
    it {should_not be_valid }
  end

  describe 'should not be valid when passwords are different' do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe 'email should be unique' do
    before do
      @user.save
      @user2 = User.new(name: "name2", email: "user1@example.com")
    end

    subject { @user2 }
    it { should_not be_valid }
  end

  describe 'email should be formatted correctly' do
    before { @user.email = "test@example" }
    it { should_not be_valid }
  end
end
