class CommentsController < ApplicationController
    before_action :set_post

    def create
        @comment = @post.comments.build(comment_params)
        @comment.author = current_user

        if @comment.save
            flash[:notice] = "Comment has been created!"
            redirect_to @post
        else
            flash.now[:alert] = "Comment not created, please revise."  
            render "posts/show"
        end
    end

    def destroy
        @comment = @post.comments.find(params[:id])
        if @comment.author == current_user
            @comment.destroy
        
            flash[:notice] = "Comment removed successfully."
            redirect_to post_path(@post)
        end
    end
    
    private
    
    def set_post
        @post = Post.find(params[:post_id])
    rescue ActiveRecord::RecordNotFound
        flash[:alert] = "This post does not exist!"
        redirect_to posts_path
    end
    
    def comment_params
        params.require(:comment).permit(:text)
    end
end
