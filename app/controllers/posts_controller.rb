class PostsController < ApplicationController
    before_action :set_post, only: %i(show edit update destroy)
  
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.author = current_user
        
        if @post.save
            flash[:notice] = "This post has been added!"
            redirect_to @post
        else
            flash[:notice] = "Something wrong, please try again"
            render :_form
        end
    end

    def show
        @comment = @post.comments.build
    end

    def edit
    end

    def update
        @post.update(post_params)

        flash[:notice] = "Post edited."
        redirect_to @post
    end

    def destroy
        @post.destroy
        
        flash[:notice] = "Your post has been deleted."
        redirect_to root_path
    end

    private

    def post_params
        params.require(:post).permit(:title, :text, :image, :open)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
