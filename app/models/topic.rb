# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text(65535)
#  is_public   :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Topic < ApplicationRecord
  extend FriendlyId
  has_many :bookmarks, dependent: :destroy
  belongs_to :user

  friendly_id :name, use: [:slugged, :finders]

  scope :of, ->(user) {where(user_id: user.id) if user.present?}

  validates :name, presence: { message: "topic name cannot be blank." }
  validates :name, uniqueness: { scope: [:user_id], message: "You already seem to have a topic with this name." }

end
