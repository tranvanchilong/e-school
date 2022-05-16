class ExamDetailsController < ApplicationController
  def index
    @exam = Exam.find_by(id: params[:exam_id])
  end
end
