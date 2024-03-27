# frozen_string_literal: true

class MacroCalculatorController < ApplicationController
  def index
    @calorie_calculator = CalorieCalculator.new
  end

  def calculate
    @calorie_calculator = CalorieCalculator.new(macro_calculator_params)

    @tdee = @calorie_calculator.tdee

    render :index, status: :unprocessable_entity unless @tdee
  end

  private

  # Only allow a list of trusted parameters through.
  def macro_calculator_params
    params.require(:calorie_calculator).permit(:gender, :age, :height, :weight, :activity)
  end
end
