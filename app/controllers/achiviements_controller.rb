class AchiviementsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @user_exams = @user.user_exams.includes(:exam) 
  end
end
