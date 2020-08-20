class Review < ApplicationRecord
  belongs_to :cocktail
  has_one_attached :photo
end
