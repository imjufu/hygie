# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/macro_calculator' do
  # This should return the minimal set of attributes required to create a valid
  # MacroCalculator. As you add validations to MacroCalculator, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    attributes_for(:calorie_calculator)
  end

  let(:invalid_attributes) do
    { gender: 'unknown' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get macro_calculator_url
      expect(response).to be_successful
    end
  end

  describe 'GET /calculate' do
    context 'with valid parameters' do
      it 'renders a successful response' do
        get macro_calculator_summary_url, params: { macro_calculator: valid_attributes }
        expect(response).to be_successful
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        get macro_calculator_summary_url, params: { macro_calculator: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
