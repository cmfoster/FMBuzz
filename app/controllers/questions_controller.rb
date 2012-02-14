class QuestionsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]
  respond_to :js, :html
  def create
    @question = Question.create(params[:question])
    @question.liked_by current_user if current_user
    respond_with @question
  end
end
