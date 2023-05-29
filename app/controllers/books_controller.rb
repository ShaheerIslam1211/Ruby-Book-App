class BooksController < ApplicationController

  skip_before_action :verify_authenticity_token
  def index
    if params[:search]
      @books = Book.search(params[:search]).order("created_at DESC")
    else
      @books = Book.all.order('created_at DESC')
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_author.books.new(books_params)
    if @book.save!
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET method for editing a product based on id
  def edit
    @book = Book.find(params[:id])
    @book.image.attach(params[:image])
  end

  # PUT method for updating in database a book based on id
  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      flash[:notice] = 'Books updated!'
      redirect_to books_path
    else
      flash[:error] = 'Failed to update books!'
      render :edit_book
    end
  end

  # DELETE method for deleting a book from database based on id
  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = 'Product deleted!'
      redirect_to books_path
    else
      flash[:error] = 'Failed to delete this product!'
      render :destroy
    end
  end

  def assign_tags
    @books = Book.all
    @tags = Tag.all
  end

  def assign_book_tags
    books = Book.find(params[:book_id])
    tags = Tag.where(id: params[:tag_id])
    tags.each do |tag|
      BooksTag.find_or_create_by(book_id: books.id, tag_id: tag.id)
    end
    redirect_to books_path
  end

  def create_session
    @book = Book.find(params[:id])
    @author = current_author
    @session = StripeWrapper::CheckoutSession
               .create_checkout_session(
                  product_name: "Books",
                  product_unit_amount: @book.price.to_i,
                  product_quantity: 1,
                  payment_intent_description: "Purchased this book - #{@book.title} purchased by #{@author.first_name} #{@author.last_name}",
                  payment_intent_suffix: "Purchased",
                  customer_email: @author.email,
                  billing_address: 'required',
                  submit_type: 'pay',
                  success_url: books_url(@book.id)+"?session_id={CHECKOUT_SESSION_ID}",
                  cancel_url: request.referer
                )

    render json: { session_id: @session.id }
  end

  private

  def books_params
    params.require(:book).permit(:title, :author, :description, :image, :published_date, :price, :genre, :language, :isbn)
  end
end
