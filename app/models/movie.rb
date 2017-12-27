class Movie < ApplicationRecord
	has_many :reviews ,  dependent: :destroy
	has_many :views ,  dependent: :destroy

	
	mount_uploader :image, MovieUploader
	validates_presence_of :title,:genre,:plot,:rating,:web
	validates :rating, numericality: { less_than_or_equal_to: 10 }

end
