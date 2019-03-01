class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update]

  def show
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
     @post = Post.new(post_params)
     if @post.valid?
       @post.save
       redirect_to post_path(@post)
     else
       render :new
     end
  end

  def update
    if @post.update(author_params)
       redirect_to post_path(@post)
     else
       render :edit
     end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
