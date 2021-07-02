class Member < ApplicationRecord
  belongs_to :division
  has_one_attached :image

  validates :name, presence: true, uniqueness: true
end
