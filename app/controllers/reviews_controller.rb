class ReviewsController < ApplicationController

before_action :authenticate_user!

	def create
		@movie=Movie.find(params[:movie_id])
		
		@review= @movie.reviews.new(review_params)
		@review[:user_id]= current_user.id
		@review.save
		 redirect_to movie_path(@movie)
	end
end


private
def review_params
	params.require(:review).permit(:Review, :user_id, :movie_id)
	
end