require 'spec_helper'

describe Note do
  before { @note = Note.new(title: "First note", description: "Note's description") }
  subject { @note }

  describe ' should respond to its field' do
    it { should respond_to(:title) }
    it { should respond_to(:description) }
  end

  describe ' should be valid when required fields are present' do
    it { should be_valid }
  end

  describe ' should be invalid when the title is missing' do
    before { @note.title = nil }
    it { should_not be_valid }
  end

  describe ' should not be valid when the description is missing' do
    before { @note.description = nil }
    it { should_not be_valid }
  end
end
