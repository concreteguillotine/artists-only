class ApplicationController < ActionController::Base
    before_action :set_post, only: %i(conversation_start)

    def conversation_start(post)
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

    def set_post
        @post = Post.find(params[:id])
    end

    def message_params
        params.require(:conversation).permit(:text, :description, :image)
    end
end
