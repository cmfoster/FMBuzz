class Question < ActiveRecord::Base
  acts_as_votable
  belongs_to :show
  belongs_to :user
  validates_presence_of :show_id, :q
  validates_length_of :q, :within => 11..60, :too_short => "Question is too short", :too_long => "Question exceeds maximum length"
  
  def self.create_filter(params)
    user = params[:user]
    show = Show.find_by_id(params[:question][:show_id])
    
    if user.questions.where(:created_at => Time.now-15.minutes..Time.now).empty?
      question = create!(params[:question])
      question.user_id = user.id
      question.liked_by user
      return question 
      {:status => "Question has be submitted" }
    else
      {:status => "You must wait at least 15 minutes to create a new question"}
    end
  end
  
end
