# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
PersonalityType.create!(
  [
    {
      name: 'Introvert',
      description: 'An introvert is a person with qualities of a personality type known as introversion, which means '\
                   'that they feel more comfortable focusing on their inner thoughts and ideas, rather than what’s '\
                   'happening externally. They enjoy spending time with just one or two people, '\
                   'rather than large groups or crowds.'
    },
    {
      name: 'Extrovert',
      description: 'Extroverts are those who enjoy being around other people. They have a strong need to socialize '\
                   'and talk to others. Extroverted people are often seen as more sociable, confident, and outgoing.'
    },
    {
      name: 'Balanced',
      description: 'Balanced personalities cannot be classified as either introvert or extrovert.'
    }
  ]
)
