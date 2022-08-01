class CoursesController < ApplicationController
    def index
        @course = Course.first
    end
    def room 
    end
    def show
        @courses = Course.all
  
        
    end
    def admin 
      @courses = Course.all
    end
    def user_class
        @ourses = Course.all
        
    end
    def new 
      @course= Course.new
    end
    def create
    @course = Course.new course_params
        if @course.save
        flash[:success] = t "controller.user.flash_success"
        redirect_to root_url
        else
        render :new
        end
    end
    def course_params
    params.require(:course).permit :name, :description
  end
  def destroy
    @courses = Course.find_by(id: params[:id]).destroy
   
    redirect_back(fallback_location: root_path)
    end
end
