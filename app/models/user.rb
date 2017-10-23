class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]



 	def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
       user.email = auth.info.email
       user.password = Devise.friendly_token[0,20]
       user.name = auth.info.name   # assuming the user model has a name
       user.save!
       #user.profile_picture = auth.info.image # assuming the user model has an image
     end
   end

end
