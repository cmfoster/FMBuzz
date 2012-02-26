class QuestionsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]
  respond_to :js, :html
  
  def create
    if current_user
      opts = params.merge!(
	:user => current_user
	)
    else
      flash[:notice] = "No Hacking"
    end
    @question = Question.create_filter(opts)
    flash[:notice] = @question[:status]
    respond_with @question
  end
  
end
