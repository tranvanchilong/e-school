  class CommentsController < ApplicationController
    before_action :correct_user, only: :destroy

    def new
    end
    
    def create
      @comment = Comment.new status_comment_params
        if @comment.save! 
          flash[:success] = "Created"
        end
      respond_to do |format|
        format.html {
          redirect_to request.referer
        }
        format.js
      end
    end

    def destroy  
      @comment = Comment.find params[:id]
      @comment.destroy
      redirect_to request.referer
      @comment.user
    end

    private

    def status_comment_params
        params.require(:comment).permit(:exam_id, :user_id, :content) 
    end
  end