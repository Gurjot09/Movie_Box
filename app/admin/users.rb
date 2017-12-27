ActiveAdmin.register User do
	decorate_with UserDecorator
index do
		column "Profile Picture" , :uimage
		column :name
		column :email
		column :password
		


	end


end
