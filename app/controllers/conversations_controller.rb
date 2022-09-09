class ConversationsController < ApplicationController
    before_action :set_post

    def show
        @conversation = Conversation.find(params[:id])
    end

    def new
        @conversation = Conversation.new 
    end

    def create
        conversation_start(message_params)
    end

    private

    def message_params
        params.require(:conversation).permit(:text, :description, :image)
    end

    def set_post
        @post = Post.find(params[:post_id])
    end
end
