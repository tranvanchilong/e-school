class UserCoursesController < ApplicationController
    def create
        @user_course = UserCourse.new user_course_param
    if @user_course.save
        flash[:success] = t "controller.user.flash_success"
        redirect_to root_url
        else
        render :new
        end
    end

    def user_course_param
        params.require(:user_course).permit :user_id, :course_id
    end
end
