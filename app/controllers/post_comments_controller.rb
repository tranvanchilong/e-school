class PostCommentsController < ApplicationController


    before_action :correct_user, only: :destroy

    def new
    end
    
    def create
      @comment = PostComment.new status_comment_params
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
      @comment = PostComment.find params[:id]
      @comment.destroy
      redirect_to request.referer
      @comment.user
    end

    private

    def status_comment_params
        params.require(:post_comment).permit(:micropost_id, :user_id, :content) 
    end

end
