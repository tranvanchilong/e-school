class UserClassesController < ApplicationController
    
    def show
        @user_classes = UserClasse.all
    end
   
    def create
    @user_class = UserClasse.new user_class_param
    if @user_class.save
        flash[:success] = t "controller.user.flash_success"
        redirect_to root_url
        else
        render :new
        end
    end

    def user_class_param
         params.require(:user_classe).permit :user_id, :classe_id
    end
end
