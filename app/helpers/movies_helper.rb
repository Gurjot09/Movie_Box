module MoviesHelper
	def movies_set?(movies)
		@m = []
		movies.each do |m|
			if m.id == nil
			else
				@m << m
			end
		end
		return @m
	end

	
end