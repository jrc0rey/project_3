require 'bcrypt'

class UserController < ApplicationController

get '/' do
	erb :login_register
end


post '/register' do
	content_type :json
	username = params[:username]
	 checkUser = User.find_by(username: username)
	 if checkUser 
		res = {result: false}
		res.to_json	 	
	 else
	 	user = User.new
		user.username = params["username"]
		user.password = params["password"]
		user.save
		session[:logged_in] = true
		session[:username] = username
		session[:user_id] = user.id
		res = {result: true}
		p session
		res.to_json
		res = {result: true}
		res.to_json
	end
end



post '/login' do
	content_type :json
	username = params[:username]
		password = params[:password]
		user = User.find_by(username: username)
		if user && user.authenticate(password)
			session[:logged_in] = true
			session[:username] = username
			session[:user_id] = user.id
			res = {result: true}
			p session
			res.to_json
		else
			res = {result: false}
			res.to_json			
		end
	end

	get '/logout' do
		session.destroy
		redirect '/welcome'
	end








end