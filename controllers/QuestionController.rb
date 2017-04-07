class QuestionController < ApplicationController


get '/' do 
	p session
	erb :question_page
end

get '/question' do
	@question = Question.all
	@question.to_json
end

post '/question' do
	@question = Question.new
	@question.question = params[:question]
	@question.created = params[:created]
	@question.user_id = session[:user_id]
	@question.username = session[:username]
	p session 
	@question.save
	@question.to_json
	redirect '/community'
end

get '/logout' do
	session.destroy
	redirect '/welcome'
end


end