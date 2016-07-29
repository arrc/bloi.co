class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: [:slugged, :finders]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :username, :uniqueness => {:case_sensitive => false}, :format => { with: /\A[a-zA-Z0-9]+\Z/ }

   mount_uploader :profile_picture, ProfileUploader

   def should_generate_new_friendly_id?
     new_record?
   end

end
