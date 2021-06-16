class PostsController < ApplicationController
  include Pagy::Backend

  def index
    @page_number = params[:page].present? ? params[:page].to_i : 1
    @pagy_posts, @posts = pagy(Post.order(:id), page: @page_number, items: 3)
    @pagy_next_posts, @next_posts = pagy(Post.order(:id), page: @page_number + 1, items: 3)
  end

  def show
    @post = Post.find(params[:id])
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

  def destroy
    Post.find(params[:id]).destroy!

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
