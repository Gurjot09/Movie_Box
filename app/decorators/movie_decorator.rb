class MovieDecorator < Draper::Decorator
  delegate_all

  def image
  	
  	if model.image_url.present?

  		h.image_tag(model.image_url, height: "50px", width: "50px")
  	
  	end
  end

end
