class AnswerPresenter < SimpleDelegator
  def print_with_personality
    return "#{content} (#{personality_score}% extrovert)" if extrovert?
    return "#{content} (#{personality_score}% introvert)" if introvert?

    "#{content} (#{personality_score}% balanced)"
  end
end
