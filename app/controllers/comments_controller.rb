class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_comment, only: [:destroy]

	def create
		@comment = @commentable.comments.new comment_params
		@comment.user_id = current_user.id
		@comment.save
		redirect_to @commentable, notice: "Your comment was succesfully posted"
	end

	def destroy
    @comment.destroy
    redirect_to @commentable, notice: 'Comment was successfully deleted.' 
  end

	private 

		def comment_params
			params.require(:comment).permit(:body)
		end

		def set_comment
      @comment = Comment.find_by(id: params[:id])
    end
end