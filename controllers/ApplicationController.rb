class ApplicationController < Sinatra::Base

enable :sessions

require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'decision_maker'
)

set :views, File.expand_path('../../views', __FILE__)
set :public_dir, File.expand_path('../../public', __FILE__)

set :session_secret, 'project3'

not_found do 
	erb :not_found
end

end