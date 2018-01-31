class User < ApplicationRecord
  has_many :reviews , dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, 
         :recoverable, :rememberable, :trackable, :validatable

         mount_uploader :uimage, UserImageUploader



         after_create :send_email

       

        def send_email
         	UserMailer.signup_confirmation(self).deliver_now
      	end 

       









        # def send_weekly_mails
        #   @user=User.all

        #   UserMailer.weekly_mails(@user).deliver_later(wait_until: 10.hours.from_now)
        # end 

end
