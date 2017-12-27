class User < ApplicationRecord
  has_many :reviews , dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         mount_uploader :uimage, UserImageUploader



         after_create :send_email

        def send_email
         	UserMailer.signup_confirmation(self).deliver_now
      	end 

end