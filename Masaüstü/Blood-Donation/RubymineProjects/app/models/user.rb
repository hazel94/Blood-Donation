class User < ActiveRecord::Base

	attr_accessor :password_confirmation

	validates :username, presence: true
	validates :password, presence: true
	validates :name, presence: true
	validates :phone_no, presence: true
	validates :email, presence: true
	validates :address, presence: true
	validates :id_no, presence: true
	validates_uniqueness_of :username
	validates_uniqueness_of :id_no
	validates_uniqueness_of :phone_no
	validates_confirmation_of :password, presence: true

	before_save :encrypt_password

	def self.authenticate(username,password)
		user=User.find_by_username(username)

	end


	def encrypt_password
		if password.present?

		end
	end
end