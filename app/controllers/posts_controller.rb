class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update]

  def show
  end

  def edit
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
    @post = Post.find(params[:id])

    @post.update(post_params)

    redirect_to post_path(@post)
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
