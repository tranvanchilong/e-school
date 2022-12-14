class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  
  def new
    
  end
  def create
    @micropost = current_user.microposts.new(micropost_params)
 
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render "static_pages/home"
    end
  end

  def destroy
    if @micropost.destroy
      flash[:success] = "Micropost deleted"
    else
      flash[:danger] = "Deleted fail"
    end
    redirect_to request.referer || root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :images)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
 
  def correct
    @correct = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
  def logged_in_user
      return if logged_in?

      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
end