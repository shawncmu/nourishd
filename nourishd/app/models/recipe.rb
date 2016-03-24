class Recipe < ActiveRecord::Base
  has_many :quantities
  has_many :ingredients, through: :quantities
  has_many :challenges
  has_many :users, through: :challenges
end
