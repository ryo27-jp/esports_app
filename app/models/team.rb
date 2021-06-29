class Team < ApplicationRecord
  has_one_attached :image
  has_many :divisions, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
