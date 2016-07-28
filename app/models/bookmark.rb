class Bookmark < ApplicationRecord
  belongs_to :flag
  belongs_to :topic
  belongs_to :user
end
