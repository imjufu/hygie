# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are: :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    AgeCalculator.new(birthdate).calculate
  end

  def macro_calc
    return @macro_calc if @macro_calc

    macro_calc = MacroCalculator.new(
      gender:,
      birthdate:,
      height:,
      weight:,
      activity:
    )

    @macro_calc = macro_calc.calculate ? macro_calc : false
  end
end
