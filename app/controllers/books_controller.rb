class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:show]
  
  # GET /books or /books.json
  def index
    @books = Book.all
    @reading_lists = ReadingList.all
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  # Deprecated. Users won't create single books like this anymore
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully added." }
        format.json { render :show, status: :created, location: @book }
        add_book_availability(@book)
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /books/1 or /books/1.json
  def remove
    # current_user.books.delete(Book.where(bid: params[:bid].first))
    
    # @book.destroy
    # respond_to do |format|
    #   format.html { redirect_to books_url, notice: "Book was successfully removed." }
    #   format.json { head :no_content }
    # end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully removed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :isbn, :bid)
    end
end
