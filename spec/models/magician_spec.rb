require 'spec_helper'

describe "Magician model" do
  before { @magician = Magician.new(firstname: "first", lastname: "last") }
  subject { @magician }

  describe 'It should respond to its fields' do
    it { should respond_to(:firstname) }
    it { should respond_to(:lastname) }
  end

  describe 'should be valid in valid cases' do
    it { should be_valid }
  end

  describe 'should not be valid when firstname is missing' do
    before { @magician.firstname = nil }
    it { should_not be_valid }
  end
end
