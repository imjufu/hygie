# frozen_string_literal: true

FactoryBot.define do
  factory :calorie_calculator do
    gender { CalorieCalculator::GENDERS.keys.fetch(Faker::Number.between(from: 0, to: 1)) }
    age { Faker::Number.between(from: 25, to: 80) }
    height { Faker::Number.between(from: 150, to: 200) }
    weight { Faker::Number.between(from: 30, to: 120) }
    activity { CalorieCalculator::ACTIVITIES.keys.fetch(Faker::Number.between(from: 0, to: 3)) }
  end
end
