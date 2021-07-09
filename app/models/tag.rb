class Tag < ApplicationRecord
  has_many :divisions_tags, dependent: :destroy
  has_many :divisions, through: :divisions_tags

  has_many :members_tags, dependent: :destroy
  has_many :members, through: :members_tags

  validates :title, presence: true
end
