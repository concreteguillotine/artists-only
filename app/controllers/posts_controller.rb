class PostsController < ApplicationController
    before_action :set_post, only: %i(show)
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        
        if @post.save
            flash[:notice] = "This post has been added!"
            redirect_to @post
        else

        end
    end

    def show
    end

    private

    def post_params
        params.require(:post).permit(:title, :text, :image, :open)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
