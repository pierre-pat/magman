require 'spec_helper'

describe Todo do
  before { @todo = Todo.new(description: "my first todo") }
  subject { @todo }

  describe 'should respond to its fields' do
    it { should respond_to(:description) }
  end

  describe 'should be valid in valid cases' do
    it { should be_valid }
  end

  describe 'should not be valid when the description is missing' do
    before { @todo.description = nil }
    it { should_not be_valid }
  end
end
