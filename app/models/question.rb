class Question < ActiveRecord::Base
  acts_as_votable
  belongs_to :show
  
end
