class OtherServiceCall
  
  def api_call(title)
    
    @title = title.split(' ').join('_')
    
    uri = URI("http://www.omdbapi.com/?t=#{@title}&apikey=c45185be")
    a = Net::HTTP.get(uri)
    b = JSON.parse(a)
    
    if b["Response"] == "True"
    

      title = b["Title"]
      image = b["Poster"]
      genre = b["Genre"].split(',').first
      plot = b["Plot"]
  
      if b["imdbRating"].split('/').second == nil
        rating = b["imdbRating"]
      else
        rating = b["imdbRating"]
      end
      web = b["Website"]
      cast = b["Actors"]
      return movie_create(title,image,genre,plot,rating,web,cast)
    else
      return false
    end
  end
  private
  
  def movie_create(title,image,genre,plot,rating,web,cast)
    @m = Movie.new
   
    @m.title = title
    @m.remote_image_url = image
    @m.genre = genre
    @m.plot =plot
    @m.rating = rating
    @m.web = web
    @m.cast = cast
    
    if @m.save
      
      @last_saved_movie=Movie.last
          @mov_id_for_views=@last_saved_movie.id
          count=0
          View.create(count: count , movie_id: @last_saved_movie.id)

      return true

    else
      return false
    end
  end
end