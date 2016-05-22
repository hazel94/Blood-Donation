class SessionsController < ApplicationController
	  
    def new
  		@user=User.new
  	end

    def index
      render :layout => 'index-layout'
    end

  	def login 
  	
  		user=User.authenticate(params[:User][:username],params[:User][:password])

  		if user
  			session[:user_id]=user.id
  			redirect_to users_homepage_path  ,:notice => "Logged in successfully"
  		else
  			redirect_to root_path, :notice => "Unable to Login"
  		end
  	end
  
  	def destroy
      	session[:user_id]=nil
      	redirect_to root_path, :notice=>"Logged Out successfully"
  	end
end
