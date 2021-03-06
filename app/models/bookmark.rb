# == Schema Information
#
# Table name: bookmarks
#
#  id          :integer          not null, primary key
#  url         :string
#  title       :string
#  description :text
#  flag_id     :integer
#  topic_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  slug        :string
#

class Bookmark < ApplicationRecord
  extend FriendlyId
  attr_accessor :topic_name
  belongs_to :flag
  belongs_to :topic
  belongs_to :user
  belongs_to :host

  friendly_id :title, use: [:slugged, :finders]

  validates :title, presence: { message: "title cannot be blank." }
  validates :url, presence: { message: "You must enter some url." }
  validates :url, uniqueness: { scope: [:user_id, :topic_id], message: "you've already bookmarked this page, choose different topic to bookmark again." }

  def self.search(search)
    where("title ILIKE ?", "%#{search}%")
    where("url ILIKE ?", "%#{search}%")
  end

  # def topic_name
  #   topic.try(:name)
  # end
  #
  # def topic_name=(name)
  #   self.topic = Topic.where(name: name).first_or_create
  #   # self.topic = Topic.find_or_create_by(name: name)
  # end

end
