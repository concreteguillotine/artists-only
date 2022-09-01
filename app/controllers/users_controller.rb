class UsersController < ApplicationController
    before_action :set_user, only: %i(show)

    def index
        @users = User.all
    end
    
    def show
        @posts = Post.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            flash[:notice] = "This user has been created."
            redirect_to @user
        else
            flash[:notice] = "Something wrong, please try again"
            render "devise/sessions/new"
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :username)
    end

    def set_user
        @user = User.find(params[:id])
    end
end