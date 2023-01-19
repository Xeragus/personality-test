class ResponseAnswer < ApplicationRecord
  belongs_to :personality_test_response
  belongs_to :answer

  self.table_name = 'responses_answers'
end
