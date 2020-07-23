class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates_uniqueness_of :cocktail_id, :ingredient_id, :scope => [:cocktail, :ingredient]

  # vamos a hacer algo nuevo
  # scope
  # unico para el par
end
