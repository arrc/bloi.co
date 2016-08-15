# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  slug                   :string
#  profile_picture        :string
#

class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: [:slugged, :finders]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :username, :uniqueness => {:case_sensitive => false}, :format => { with: /\A[a-zA-Z0-9]+\Z/ }

   mount_uploader :profile_picture, ProfileUploader

   has_many :bookmarks, dependent: :destroy
   has_many :topics, dependent: :destroy

   def should_generate_new_friendly_id?
     new_record?
   end

end
