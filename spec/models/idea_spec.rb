require "rails_helper"

RSpec.describe Idea, :type => :model do
  context "invalid attributes" do
    # let(:idea) { Idea.new(:title "Idea1", :body "Idea Body") }
    it "is invalid without a title" do
      idea = Idea.new(body: "Idea Body")
      expect(idea).to_not be_valid
    end
    it "is invalid without a body" do
      idea = Idea.new(title: "Idea1")
      expect(idea).to_not be_valid
    end
  end
end