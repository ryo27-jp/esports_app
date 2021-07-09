class MembersTag < ApplicationRecord
  belongs_to :member
  belongs_to :tag
end
