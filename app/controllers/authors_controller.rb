class AuthorsController < ApplicationController

  before_action :set_author, only: %i[show edit update]

  def show
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
     if @author.valid?
       @author.save
       redirect_to author_path(@author)
     else
       render :new
     end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
