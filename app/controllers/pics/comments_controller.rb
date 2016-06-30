class Pics::CommentsController < CommentsController
	before_action :set_commentable

	private

		def set_commentable
			@commentable = Pic.find(params[:pic_id])
		end

end

