# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MacroCalculator do
  subject(:macro_calc) do
    described_class.new({
                          gender: 'male',
                          age: 39,
                          height: 180,
                          weight: 80,
                          activity: 'moderately_active'
                        })
  end

  describe '#calculate' do
    it 'returns a Hash' do
      expect(macro_calc.calculate).to be_a Hash
    end

    it 'returns the macronutrients in grams' do
      expect(macro_calc.calculate).to eq({
                                           carbohydrate_in_grams: 442,
                                           lipid_in_grams: 107,
                                           protein_in_grams: 120
                                         })
    end

    context 'when the object is invalid' do
      before { macro_calc.gender = 'unknown' }

      it 'returns false' do
        expect(macro_calc.calculate).to be false
      end
    end
  end
end
