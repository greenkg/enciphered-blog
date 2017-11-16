class PostsController < ApplicationController

	before_action :require_signin, except: [:index, :show]
	before_action :require_admin, except: [:index, :show]

	def index
		@posts = Post.order("published_on DESC")
	end

	def show
		@post = Post.find_by!(slug: params[:id])
		@likers = @post.likers
		@comments = @post.comments
		@topics = @post.topics
		if @post.project_id
			@project =  Project.find(@post.project_id)
		end
		if current_user
			@current_like = current_user.likes.find_by(post_id: @post.id)
		end
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post, notice: "Post succesfully created!"
		else
			render :new
		end
	end

	def edit
		@post = Post.find_by(slug: params[:id])
	end

	def update
		@post = Post.find_by(slug: params[:id])
		if @post.update(post_params)
			flash[:notice] = "Post successfully updated!"
			redirect_to @post
		else
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_url, alert: "Post successfully deleted!"
	end

private

	def post_params
		post_params = params.require(:post).permit(:title, :slug, :body, :author, :image_file_name, :category, :project_id, :published_on, topic_ids: [])
	end

end
