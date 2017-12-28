class MoviesController < ApplicationController


	def detail
		if params[:search].present?
			@searched_movies =  Movie.where(['title like ?', "%"+params[:search]+"%"])
			
		else
		end
		
		@view_order=View.order('count desc')
		@rating=Movie.order('rating desc') 
   		 @toss= params[:view]
    end

	def index
		if params[:search].present?
			
			@searched_movies=  Movie.where(['title like ?', "%"+params[:search]+"%"])
			
		else

		end
				@rating=Movie.order('rating desc') 
		@view_order=View.order('count desc')	
	end

	
	def new
		
	end


	def create
	
			if params[:view]=="automatic"
				
				@call=OtherServiceCall.new.api_call(params[:movie123][:title])
				
				if @call== true
					   redirect_to "http://marohost:3000/admin/movies",notice: "movie Successfully Saved"
      			else
        			   redirect_to new_admin_movie_path(view: params[:view]),alert: "Movie Not Found Please verify it."
      			end


			else
			@movie=Movie.new(valid_params)
			
		
				if @movie.save
				
					@last_saved_movie=Movie.last
					@mov_id_for_views=@last_saved_movie.id
					count=0
					View.create(count: count , movie_id: @last_saved_movie.id)
					redirect_to movie_path(@movie)
	
				else
					render 'new'
				end
	
				
			end


			
	end	


	def show
		@movie=Movie.find(params[:id])
		@movies = @movie.reviews
		@get_genre=@movie.genre	   
	    @all_movie=Movie.where(genre: @get_genre).order('rating desc')
    	
    	get_count=View.find_by(movie_id: @movie.id)
    	count=get_count.count
		inc_count=count+1
		
		View.where(movie_id: @movie.id).update(count: inc_count)	    
	    
	   
	end



	private
	def valid_params
		params.require(:movie123).permit(:title,:genre,:plot,:image,:rating,:web,:cast)
		
	end
end


