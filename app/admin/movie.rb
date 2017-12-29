ActiveAdmin.register Movie do
	decorate_with MovieDecorator
	

	



  action_item :new_movie,only: :index do
     link_to "Automatically Movie Upload", "https://moviegbox.herokuapp.com/admin/movies/new?view=automatic"
     end
  
  form :html => { :enctype => "multipart/form-data" } do |f|
     f.inputs do
       render "movies/form",    {view: params[:view]}
     end
   end

end