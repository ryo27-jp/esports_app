class Division < ApplicationRecord
  belongs_to :team
  has_many :members
  has_one_attached :image

  has_many :divisions_tags, dependent: :destroy
  has_many :tags, through: :divisions_tags

  validates :name, presence: true, uniqueness: true
end
