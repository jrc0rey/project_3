require 'sinatra/base'

require './controllers/ApplicationController'
require './controllers/QuestionController'
require './controllers/UserController'
require './controllers/CommentController'

require './models/UserModel'
require './models/CommentModel'
require './models/QuestionModel'

map ('/') {run ApplicationController}
map ('/welcome') {run UserController}
map ('/question') {run QuestionController}
map ('/community') {run CommentController}