# frozen_string_literal: true

class CalorieCalculator
  include ActiveModel::API

  GENDERS = {
    female: -161,
    male: 5
  }.freeze

  ACTIVITIES = {
    sedentary: 1.2,
    lightly_active: 1.375,
    moderately_active: 1.55,
    active: 1.725,
    very_active: 1.9,
  }.freeze

  attr_accessor :gender, :age, :height, :weight, :activity

  validates :gender, inclusion: { in: GENDERS.keys.map(&:to_s) }
  validates :age, :height, :weight, numericality: { greater_than: 0, only_integer: true }
  validates :activity, inclusion: { in: ACTIVITIES.keys.map(&:to_s) }

  def tdee
    @tdee ||= calculate_tdee.to_i
  end

  def bmr
    @bmr ||= calculate_bmr.to_i
  end

  private

  def calculate_bmr
    # BMR = Basal Metabolic Rate
    # Based on the Mifflin-St Jeor Formula: https://pubmed.ncbi.nlm.nih.gov/2305711/
    return false unless valid?

    (10 * weight.to_i) + (6.25 * height.to_i) - (5 * age.to_i) + GENDERS.fetch(gender.to_sym)
  end

  def calculate_tdee
    # TDEE = Total Daily Energy Expenditure
    return false unless bmr

    bmr * ACTIVITIES.fetch(activity.to_sym)
  end
end
