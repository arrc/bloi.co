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

require 'test_helper'

class BookmarkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
