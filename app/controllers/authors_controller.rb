class AuthorsController < ApplicationController

  def index
    @author = Author.all
  end
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author

    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)ƒ
      flash[:notice] = 'Author Updated'
      redirect_to @author
    else
      flash[:error] = 'Unable to edit Author'
      redirect_to edit_author_registration
    end
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :email, :password, :confirmation_password)
  end
end
