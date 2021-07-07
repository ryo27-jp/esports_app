class Member < ApplicationRecord
  belongs_to :division
  has_one_attached :image

  has_many :members_tags
  has_many :tags, through: :members_tags

  validates :name, presence: true, uniqueness: true
end
