class CommentsController < ApplicationController

	before_action :set_post
	before_action :require_signin, except: [:index, :show]

	def index
		@comments = @post.comments
	end

	def new
		@comment = @post.comments.new
	end

	def create
		@comment = @post.comments.new(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to post_comments_path(@post), notice: "Comment succesfully created!"
		else
			render :new
		end
	end

private

	def comment_params
		comment_params = params.require(:comment).permit(:comment)
	end

	def set_post
  	@post = Post.find(params[:post_id])
	end

end
