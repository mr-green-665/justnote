class SessionsController < ApplicationController

	def create
		user = User.from_omniauth(env["omniauth.auth"])
		logger.debug("dsfdsf")
		logger.debug(user)
		session[:user_id] = user.id
		redirect_to root_url, notice: "Signed!"
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: "Signed out!"
	end
end