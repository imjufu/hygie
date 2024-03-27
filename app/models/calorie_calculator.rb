# frozen_string_literal: true

class CalorieCalculator
  include ActiveModel::API

  GENDERS = {
    'woman' => -161,
    'man' => 5
  }.freeze

  ACTIVITIES = {
    'sedentary' => 1.55,
    'moderately_active' => 1.85,
    'active' => 2.2,
    'very_active' => 2.4
  }.freeze

  attr_accessor :gender, :age, :height, :weight, :activity

  validates :gender, inclusion: { in: GENDERS.keys }
  validates :age, :height, :weight, numericality: { greater_than: 0, only_integer: true }
  validates :activity, inclusion: { in: ACTIVITIES.keys }

  def tdee
    calculate_tdee
  end

  private

  def calculate_bmr
    # BMR = Basal Metabolic Rate
    return false unless valid?

    (10 * weight.to_i) + (6.25 * height.to_i) - (5 * age.to_i) + GENDERS.fetch(gender)
  end

  def calculate_tdee
    # TDEE = Total Daily Energy Expenditure
    bmr = calculate_bmr
    return false unless bmr

    bmr * ACTIVITIES.fetch(activity)
  end
end
