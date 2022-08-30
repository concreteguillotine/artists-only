class ConversationsController < ApplicationController
    before_action :set_post

    def show
        @conversation = Conversation.find(params[:id])
    end

    def new
        @conversation = Conversation.new 
    end

    def create
        @conversation = @post.conversations.build(message_params)
        @conversation.author = current_user
        @conversation.user = @post.author
        
        if @conversation.save
            flash[:notice] = "Message sent, awaiting approval from the original poster!"
            redirect_to @post
        else
            flash[:notice] = "Something wrong, please try again"
            redirect_to @post
        end
    end

    private

    def message_params
        params.require(:conversation).permit(:text, :description, :image)
    end

    def set_post
        @post = Post.find(params[:post_id])
    end

end
