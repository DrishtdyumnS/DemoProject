class UsersController < ApplicationController
    before_action :is_logged_in? , except: [:index, :show]
    before_action :is_same? , only: [:edit ,:update ,:destroy]
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end 

    def create        
        @user = User.new(params.require(:user).permit(:username,:email,:password))
        if @user.save 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(params.require(:user).permit(:username,:email,:password))
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    def destroy
        @user = User.find(params[:id])
        session[:user_id] = nil if !current_user.admin?
        @user.destroy
        redirect_to users_path
    end

    private
        def is_same?
            @user = User.find(params[:id])
            if current_user != @user and !current_user.admin?
                redirect_to users_path
            end
        end
end