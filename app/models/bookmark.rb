# == Schema Information
#
# Table name: bookmarks
#
#  id          :integer          not null, primary key
#  url         :string(255)
#  title       :string(255)
#  description :text(65535)
#  flag_id     :integer
#  topic_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Bookmark < ApplicationRecord
  attr_accessor :topic_name
  belongs_to :flag
  belongs_to :topic
  belongs_to :user
  belongs_to :host

  # def topic_name
  #   topic.try(:name)
  # end
  #
  # def topic_name=(name)
  #   self.topic = Topic.where(name: name).first_or_create
  #   # self.topic = Topic.find_or_create_by(name: name)
  # end

end
