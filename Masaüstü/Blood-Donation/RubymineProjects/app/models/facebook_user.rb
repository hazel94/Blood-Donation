class FacebookUser < ActiveRecord::Base

	#attr_accessor :provider, :fbkuser_id, :name, :oauth_token, :oauth_expires_at, :email
	def self.from_omniauth(auth)

			user=FacebookUser.find_by_fbkuser_id(auth.uid)
			if user.present?
				#return user if alreay registered 
				user
			else
				#register the user
				user=FacebookUser.new
				user.provider=auth.provider
				user.email=auth.info.email
				user.fbkuser_id=auth.uid
			    user.fbkuser_name=auth.info.name
			    user.oauth_token=auth.credentials.token
			    user.oauth_expires_at=Time.at(auth.credentials.expires_at)
			    if user.save
			    	user
			    else
			    	false
			    end

			end

	end
end