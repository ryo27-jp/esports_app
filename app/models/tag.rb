class Tag < ApplicationRecord
  has_many :divisions_tags
  has_many :divisions, through: :divisions_tags
  
  validates :title, presence: true
end
