# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MacroCalculatorController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/macro_calculator').to route_to('macro_calculator#index')
    end

    it 'routes to #calculate' do
      expect(get: '/macro_calculator/summary').to route_to('macro_calculator#calculate')
    end
  end
end
