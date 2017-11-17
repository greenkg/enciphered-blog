class CommentsController < ApplicationController

	before_action :set_post

	def index
		@comments = @post.comments
	end

	def new
		@comment = @post.comments.new
	end

	def create
		@comment = @post.comments.new(comment_params)
		if current_user
			@comment.user = current_user
		else
		  @comment.user = current_user || User.new_guest(params[:name], params[:email])
		  session[:user_id] = @comment.user.id
		end
		if @comment.save
			redirect_to @post, notice: "Comment succesfully created!"
		else
			redirect_to @post, notice: @comment.errors.full_messages
		end
	end

private

	def comment_params
		comment_params = params.require(:comment).permit(:comment, :name)
	end

	def set_post
  	@post = Post.find_by(slug: params[:post_id])
	end

end
