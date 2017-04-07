class Question < ActiveRecord::Base
	belongs_to :user
	self.table_name = 'questions'
end