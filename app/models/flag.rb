# == Schema Information
#
# Table name: flags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Flag < ApplicationRecord
  has_many :bookmarks
end
