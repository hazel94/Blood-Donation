class UsersController < ApplicationController

    layout "userhome_layout"

  	def new
  		@user=User.new
      render :layout => 'index-layout'
  	end

  	def index 
      render :layout => 'index-layout'
  	end

  	def create
  		@user=User.new(user_params)
  		if @user.save
    			redirect_to root_path, :notice => "Registered Successfully" 
  		else
  	  		render 'new'
  		end
   	end

    def edit
      if session[:user_id].present?
        @user=User.find(session[:user_id])
        render 'edit'
      else
        render 'homepage', :notice=>"Login to Edit"
      end
    end

    def update
      @user = User.find(session[:user_id])

 
      if @user.update(user_params)
        redirect_to users_homepage_path, :notice => "Successfully Updated !!"
      else
        render 'edit'
      end
    end

    def user_params
      params.require(:user).permit(:username, :password, :name, :blood_group, :phone_no, :email, :address, :id_no)
    end


    def change_status
      @user = User.find(session[:user_id]) if session[:user_id]
      @user = FacebookUser.find(session[:fbkuser_id]) if session[:fbkuser_id]
    end

    def status_change
      @user = User.find(session[:user_id]) if session[:user_id]
     # @user = FacebookUser.find(session[:fbkuser_id]) if session[:fbkuser_id]
      if session[:user_id]
        @arg=params.require(:user).permit(:status)
     # else
      #  @arg=params.require(:facebook_user).permit(:status)
      end 

      if @user.update(@arg)
        redirect_to users_homepage_path, :notice => "Status Successfully Updated"
      else
        render 'change_status', :notice => "Could Not Update"
      end
    end

    def homepage
      @user=User.find(session[:user_id]) if session[:user_id]
      #@user=FacebookUser.find(session[:fbkuser_id]) if session[:fbkuser_id]
      render :layout => 'userhome_layout'
    end

    def blood_donors
      render :layout => 'userhome_layout'
    end

    def blood_donors_unregister
      render :layout => 'index-layout'
    end

    def emergency
      render :layout => 'index-layout'
    end



 	#private
  	

end
