FactoryBot.define do
  factory(:question) do
    content { 'How are you?' }

    after(:create) { |question| create_list(:answer, 2, question:) }
  end
end
