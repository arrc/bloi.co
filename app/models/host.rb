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

class Host < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
end
