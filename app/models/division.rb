class Division < ApplicationRecord
  belongs_to :team
  has_many :members
  has_one_attached :image

  validates :name, presence: true, uniqueness: true
end
