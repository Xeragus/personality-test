questions_data = [
  {
    content: 'You’re really busy at work and a colleague is telling you their life story and personal woes. You:',
    answers: {
      0 => {
        content: 'Don’t dare to interrupt them',
        introvert_score: 90
      },
      1 => {
        content: 'Think it’s more important to give them some of your time; work can wait',
        introvert_score: 70
      },
      2 => {
        content: 'Listen, but with only with half an ear',
        introvert_score: 40
      },
      3 => {
        content: 'Interrupt and explain that you are really busy at the moment',
        introvert_score: 10
      }
    }
  },
  {
    content: 'You’ve been sitting in the doctor’s waiting room for more than 25 minutes. You:',
    answers: {
      0 => {
        content: 'Look at your watch every two minutes',
        introvert_score: 90
      },
      1 => {
        content: 'Bubble with inner anger, but keep quiet',
        introvert_score: 70
      },
      2 => {
        content: 'Explain to other equally impatient people in the room that the doctor is always running late',
        introvert_score: 20
      },
      3 => {
        content: 'Complain in a loud voice, while tapping your foot impatiently',
        introvert_score: 5
      }
    }
  },
  {
    content: 'You’re having an animated discussion with a colleague regarding a project that you’re in charge of. You:',
    answers: {
      0 => {
        content: 'Don’t dare contradict them',
        introvert_score: 95
      },
      1 => {
        content: 'Think that they are obviously right',
        introvert_score: 70
      },
      2 => {
        content: 'Defend your own point of view, tooth and nail',
        introvert_score: 30
      },
      3 => {
        content: 'Continuously interrupt your colleague',
        introvert_score: 10
      }
    }
  }
]

questions_data.each do |question_data|
  Question.find_or_initialize_by(content: question_data[:content]).update!(answers_attributes: question_data[:answers])
end

PersonalityType.create!(
  [
    {
      name: PersonalityType::NAMES::INTROVERT,
      description: 'An introvert is a person with qualities of a personality type known as introversion, which means '\
                   'that they feel more comfortable focusing on their inner thoughts and ideas, rather than what’s '\
                   'happening externally. They enjoy spending time with just one or two people, '\
                   'rather than large groups or crowds.'
    },
    {
      name: PersonalityType::NAMES::INTROVERT,
      description: 'Extroverts are those who enjoy being around other people. They have a strong need to socialize '\
                   'and talk to others. Extroverted people are often seen as more sociable, confident, and outgoing.'
    },
    {
      name: PersonalityType::NAMES::BALANCED,
      description: 'Balanced personalities cannot be classified as either introvert or extrovert.'
    }
  ]
)
