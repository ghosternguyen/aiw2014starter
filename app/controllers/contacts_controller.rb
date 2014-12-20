class ContactsController < ApplicationController
	def new
		@contact = Contact.new
		@men_cat = Category.all
		@bar_cat = @men_cat.limit(5)
		@popularposts = Post.all.order('created_at DESC').limit(3)
		@recentposts = Post.all.order('created_at DESC').limit(3).offset(1)
	end
	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			flash.now[:notice] = 'Thank you for your message!'
		else
			flash.now[:error] = 'Cannot send message.'
			render :new
		end
		@men_cat = Category.all
		@bar_cat = @men_cat.limit(5)
		@popularposts = Post.all.order('created_at DESC').limit(3)
		@recentposts = Post.all.order('created_at DESC').limit(3).offset(1)
	end
	private
	def contact_params
		params.require(:contact).permit(:name, :email, :message)		
	end
end
