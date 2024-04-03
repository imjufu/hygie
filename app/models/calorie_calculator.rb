# frozen_string_literal: true

class CalorieCalculator
  include ActiveModel::API

  GENDERS = {
    female: -161,
    male: 5
  }.freeze

  ACTIVITIES = {
    sedentary: 1.55,
    moderately_active: 1.85,
    active: 2.2,
    very_active: 2.4
  }.freeze

  attr_accessor :gender, :age, :height, :weight, :activity

  validates :gender, inclusion: { in: GENDERS.keys.map(&:to_s) }
  validates :age, :height, :weight, numericality: { greater_than: 0, only_integer: true }
  validates :activity, inclusion: { in: ACTIVITIES.keys.map(&:to_s) }

  def tdee
    @tdee ||= calculate_tdee
  end

  def bmr
    @bmr ||= calculate_bmr
  end

  private

  def calculate_bmr
    # BMR = Basal Metabolic Rate
    return false unless valid?

    (10 * weight.to_i) + (6.25 * height.to_i) - (5 * age.to_i) + GENDERS.fetch(gender.to_sym)
  end

  def calculate_tdee
    # TDEE = Total Daily Energy Expenditure
    return false unless bmr

    bmr * ACTIVITIES.fetch(activity.to_sym)
  end
end
