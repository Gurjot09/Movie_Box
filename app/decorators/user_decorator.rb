class UserDecorator < Draper::Decorator
  delegate_all

  def uimage
  	if model.uimage_url.present?
  		h.image_tag(model.uimage_url, height: "50px", width: "50px")
  		
  	end
  end
end
