class CommentController < ApplicationController

get '/' do
	@question = Question.all.reverse
	erb :community_page
end

# get '/comments' do
# 	@question = 
# end

post '/good/:id' do
	content_type :json
	id = params[:id]
	@question = Question.find(id)
	if @question.good 
		@question.good = @question.good + 1
	else
		@question.good = 1
	end
	@question.save
	@question.to_json
end

post '/bad/:id' do
	content_type :json
	id = params[:id]
	@question = Question.find(id)
	if @question.bad 
		@question.bad = @question.bad + 1
	else
		@question.bad = 1
	end
	@question.save
	@question.to_json
end


post '/creepy/:id' do
	content_type :json
	id = params[:id]
	@question = Question.find(id)
	if @question.creepy 
		@question.creepy = @question.creepy + 1
	else
		@question.creepy = 1
	end
	@question.save
	@question.to_json
end



get '/logout' do
	session.destroy
	redirect '/welcome'
end

end