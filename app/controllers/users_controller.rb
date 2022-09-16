class UsersController < ApplicationController
    before_action :set_user, only: %i(show edit update destroy)

    def index
        @users = User.all
    end
    
    def show
        @posts = Post.all
        @conversations = Conversation.all
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

    def edit
    end

    def update
        @user.update(user_params)

        flash[:notice] = "Profile updated."
        redirect_to user_path(current_user)
    end

    def destroy
        @user.destroy
        
        flash[:notice] = "Your profile has been deleted! Good bye."
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :username, :about, :image)
    end

    def set_user
        @user = User.find(params[:id])
    end

end