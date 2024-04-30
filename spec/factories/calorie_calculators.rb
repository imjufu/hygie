# frozen_string_literal: true

FactoryBot.define do
  factory :calorie_calculator do
    gender { CalorieCalculator::GENDERS.keys.fetch(Faker::Number.between(from: 0, to: 1)) }
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
    height { Faker::Number.between(from: 150, to: 200) }
    weight { Faker::Number.between(from: 30, to: 120) }
    activity { CalorieCalculator::ACTIVITIES.keys.fetch(Faker::Number.between(from: 0, to: 3)) }
  end
end
