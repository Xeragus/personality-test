require 'rails_helper'

RSpec.describe Question, type: :model do
  it "has many answers" do
    expect(Question.reflect_on_association(:answers).macro).to eq(:has_many)
  end
end