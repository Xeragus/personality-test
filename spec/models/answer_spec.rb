require 'rails_helper'

RSpec.describe Answer, type: :model do
  it 'belongs to question' do
    expect(Answer.reflect_on_association(:question).macro).to eq(:belongs_to)
  end
end
