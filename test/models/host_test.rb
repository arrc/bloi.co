# == Schema Information
#
# Table name: hosts
#
#  id         :integer          not null, primary key
#  name       :string
#  favicon    :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class HostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
