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
    very_active: 1.9
  }.freeze

  attr_accessor :gender, :birthdate, :height, :weight, :activity

  validates :birthdate, presence: true
  validates :gender, inclusion: { in: GENDERS.keys.map(&:to_s) }
  validates :height, :weight, numericality: { greater_than: 0, only_integer: true }
  validates :activity, inclusion: { in: ACTIVITIES.keys.map(&:to_s) }

  def tdee
    return @tdee if @tdee

    tdee = calculate_tdee
    @tdee = tdee ? tdee.to_i : tdee
  end

  def bmr
    return @bmr if @bmr

    bmr = calculate_bmr
    @bmr = bmr ? bmr.to_i : bmr
  end

  def age
    AgeCalculator.new(birthdate).calculate
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
