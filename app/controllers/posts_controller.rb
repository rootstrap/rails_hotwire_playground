class PostsController < ApplicationController
  def index
    first_post = Post.first
    if first_post
      redirect_to post_path(id: first_post.id)
    else
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @next_post = @post.next
  rescue ActiveRecord::RecordNotFound => e
    flash[:error] = e.message
    redirect_to new_post_path
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create!(post_params)
    redirect_to @post, notice: 'Post was successfully created.'
  rescue ActiveRecord::RecordInvalid => e
    flash[:error] = e.message
    redirect_to new_post_path
  end

  def update
    Post.find(params[:id]).update!(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
