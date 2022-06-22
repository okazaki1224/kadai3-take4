class BooksController < ApplicationController
  before_action:ensure,only:[:edit, :update]

  def new
  end

  def index
    @book=Book.new
    @books=Book.all
  end

#Q. show画面から投稿するためにBook.newが必要だが@bookはもう使われている
#A. ｲﾝｽﾀﾝｽ変数の名前＠○○は正直なんでもいい、ただ後から見てわかりやすい名前が無難。
#.newがあることで、form_withヘルパーが自動で「新規投稿だ」と判断してくれる。
  def show
    @book=Book.find(params[:id])
    @new_book=Book.new
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path(@book.id),notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def create

    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      redirect_to book_path(@book.id),notice: "You have creaated book successfully."

    else
      @books=Book.all
      render :index
    end
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

   def ensure
    @book=Book.find(params[:id])
    unless @book.user==current_user
    redirect_to books_path
    end
   end

end
