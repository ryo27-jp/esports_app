class Division < ApplicationRecord
  belongs_to :team
  has_one_attached :image

  validates :name, presence: true, uniqueness: true
end
