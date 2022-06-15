class BooksController < ApplicationController
  def new
  end

  def index
    @book=Book.new
    @books=Book.all
  end

# show画面から投稿するためにBook.newが必要だが@bookはもう使われている
# ↑ｲﾝｽﾀﾝｽ変数の名前＠○○は正直なんでもいい、あとから見てわかりやすい名前が無難ではある。
#.newがあることで、form_withヘルパーが自動で「新規投稿だ」と判断してくれる。
  def show
    @book=Book.find(params[:id])
    @new_book=Book.new
  end

  def edit
  end
  
  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to book_path(@book.id)
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
  
end
