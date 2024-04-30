# frozen_string_literal: true

class MyAccountController < ApplicationController
  before_action :set_user, only: %i[show]

  # GET /my_account
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end
end
