class Cocktail < ApplicationRecord
  has_many :doses, dependent: :delete_all
  has_many :reviews, dependent: :delete_all
  has_many :ingredients, through: :doses
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true
end
