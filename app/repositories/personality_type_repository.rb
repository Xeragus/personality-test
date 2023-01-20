class PersonalityTypeRepository
  class << self
    def introvert
      PersonalityType.find_by(name: PersonalityType::NAMES::INTROVERT)
    end

    def extrovert
      PersonalityType.find_by(name: PersonalityType::NAMES::EXTROVERT)
    end

    def balanced
      PersonalityType.find_by(name: PersonalityType::NAMES::BALANCED)
    end
  end
end
