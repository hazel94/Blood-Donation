class FacebookusersController < ApplicationController

	def create
		fbkuser=FacebookUser.from_omniauth(request.env["omniauth.auth"])
		if fbkuser.present?
			session[:fbkuser_id]=fbkuser.id
			redirect_to users_homepage_path
		else
			redirect_to root_path, :notice=>"Could not Log In"
		end
		
	end

	def destroy
		session[:fbkuser_id]=nil
		redirect_to root_url, :notice=>"Logged Out"
	end

end