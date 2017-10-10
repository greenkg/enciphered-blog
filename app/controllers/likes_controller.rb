class LikesController < ApplicationController

  before_action :set_post

  def create
    @post.likes.create!(user: current_user)
    redirect_to @post, notice: "Thanks for liking!"
  end

  def destroy
    
    like = current_user.likes.find(params[:id])
    like.destroy
    redirect_to @post, notice: "Sorry you didn't like it!"
  end

private

  def set_post
    @post = Post.find(params[:post_id])
  end

end
