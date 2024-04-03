# frozen_string_literal: true

class MacroCalculatorController < ApplicationController
  def index
    @macro_calculator = MacroCalculator.new(activity: MacroCalculator::ACTIVITIES.first.first)
  end

  def calculate
    @macro_calculator = MacroCalculator.new(macro_calculator_params)
    @macro_details = @macro_calculator.calculate

    render :index, status: :unprocessable_entity unless @macro_details
  end

  private

  # Only allow a list of trusted parameters through.
  def macro_calculator_params
    params.require(:macro_calculator).permit(:gender, :age, :height, :weight, :activity)
  end
end
