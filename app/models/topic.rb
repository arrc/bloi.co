class Topic < ApplicationRecord
  has_many :bookmarks
  belongs_to :user
end
