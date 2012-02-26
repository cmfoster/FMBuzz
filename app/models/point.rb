class Point < ActiveRecord::Base
  belongs_to :user
  belongs_to :show
  validates_presence_of :user_id, :show_id, :points
end
