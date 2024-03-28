# frozen_string_literal: true

class MacroCalculator < CalorieCalculator
  include ActiveModel::API

  def calculate
    return false unless valid?

    {
      protein_in_grams: protein_in_grams,
      lipid_in_grams: lipid_in_grams,
      carbohydrate_in_grams: carbohydrate_in_grams,
    }
  end

  private

  def protein_in_grams
    @protein_in_grams ||= 1.5 * weight.to_i
  end

  def lipid_in_grams
    @lipid_in_grams ||= lipid_in_calories / 9
  end

  def carbohydrate_in_grams
    @carbohydrate_in_grams ||= carbohydrate_in_calories / 4
  end

  def protein_in_calories
    protein_in_grams * 4
  end

  def lipid_in_calories
    tdee * 0.3
  end

  def carbohydrate_in_calories
    tdee - (protein_in_calories + lipid_in_calories)
  end
end
