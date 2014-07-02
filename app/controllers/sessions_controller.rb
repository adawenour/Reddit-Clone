class SessionsController < ApplicationController
	def new 

	end

	def create
		user = User.where(username: params[:username]).first
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:notice] = "welcome, you've logged in."
			redirect_to root_path
		else
			flash[:error] = "There is something wrong with your username or password."
			redirect_to login_path #or render :new
		end
	end

	def destory
		session[:user_id] = nil
		flash[:notice] = "You've logged out."
		redirect_to root_path
	end
end