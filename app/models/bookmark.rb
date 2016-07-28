class Bookmark < ApplicationRecord
  belongs_to :flag
  belongs_to :topic
  belongs_to :user

  def topic_name
    topic.try(:name)
  end

  def topic_name=(name)
    # self.topic = Topic.where(name: name).first_or_create
    self.topic = Topic.find_or_create_by(name: name)
  end
end
