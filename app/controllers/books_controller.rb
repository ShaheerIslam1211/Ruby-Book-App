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

  # GET method for editing a product based on id
  def edit
    @book = Book.find(params[:id])
    @book.image.attach(params[:image])
  end

  def create
    @book = current_author.books.new(books_params)
    if @book.save!
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
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
    @user = current_user
    @session = StripeWrapper::CheckoutSession
               .create_checkout_session(
                  product_name: "Books",
                  product_unit_amount: @book.price.to_i,
                  product_quantity: 1,
                  payment_intent_description: "Purchased this book - #{@book.title} purchased by #{@user.first_name} #{@user.last_name}",
                  payment_intent_suffix: "Purchased",
                  customer_email: @user.email,
                  billing_address: 'required',
                  submit_type: 'pay',
                  success_url: process_book_payment_url(@book.id)+"?session_id={CHECKOUT_SESSION_ID}",
                  cancel_url: request.referer
                )

    render json: { session_id: @session.id }
  end

  def process_book_payment
    @book = Book.find(params[:id])
    @book_order = BookOrder.new
    @user = current_user
    @stripe_session = StripeWrapper::CheckoutSession.new
    @stripe_session.fetch_session_and_other_details(params["session_id"])
    @book_order.update(
      email: @stripe_session.charge["billing_details"]["email"],
      billing_address_one: @stripe_session.charge["billing_details"]["address"]["line1"],
      billing_city: @stripe_session.charge["billing_details"]["address"]["city"],
      billing_zipcode: @stripe_session.charge["billing_details"]["address"]["postal_code"],
      billing_state: @stripe_session.charge["billing_details"]["address"]["state"],
      billing_country: @stripe_session.charge["billing_details"]["address"]["country"],
      original_amount: @stripe_session.charge.amount_captured,
      final_amount: @stripe_session.charge.amount
    )
    render 'thanks'
  end

  private

  def book_order_params
    params.require(:book_order).permit(
      :book_id,
      :email,
      :original_amount,
      :final_amount,
      :processing_fee,
      :sms_donation,
      :billing_first_name,
      :billing_last_name,
      :billing_address_one,
      :billing_address_two,
      :billing_city,
      :billing_zipcode,
      :billing_state,
      :billing_country,
      :processed,
      :transfer_amount,
      :stripe_transaction_token,
      :stripe_transfer_token,
      :stripe_session_id,
      :processed_on,
      :user
    )
  end

  def books_params
    params.require(:book).permit(
      :title,
      :author,
      :description,
      :image,
      :published_date,
      :price,
      :genre,
      :language,
      :isbn
    )
  end
end
