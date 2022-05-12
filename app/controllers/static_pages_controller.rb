class StaticPagesController < ApplicationController
  
  def home
    @exams = Exam.all
    @count_cart = Examcart.where(user_id: session[:user_id]).count
  end
end
