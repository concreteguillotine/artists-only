class PostsController < ApplicationController
    before_action :set_post, only: %i(show edit update destroy add)
    before_action :set_conversation, only: %i(add)
  
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
        if current_user == @post.author
            @post.update(post_params)

            flash[:notice] = "Post edited."
            redirect_to @post
        else
            conversation_start(post_params)
        end
    end

    def destroy
        @post.destroy
        
        flash[:notice] = "Your post has been deleted."
        redirect_to root_path
    end

    def add
        @post.addltext = @conversation.text
        if @conversation.image.present?
            @post.addlimage = @conversation.image
        end

        @post.save
            flash[:notice] = "Additions added!"
            redirect_to @post
    end

    private

    def post_params
        params.require(:post).permit(:title, :text, :image, :addltext, :open, :closed)
    end

    def message_params
        params.require(:conversation).permit(:text, :description, :image)
    end

    def set_conversation
        @conversation = Conversation.find(params[:id])
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
