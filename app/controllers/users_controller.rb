class UsersController < ApplicationController
  def index
    @users=User.all
    @new_book=Book.new
  end

  def show
    flash[:notice]="Welcome! You have signed up successfully."
    @user=User.find(params[:id])
    @books=@user.books
    @new_book=Book.new
  end

  def edit
      @user=User.find(params[:id])
  end
  
  def create
  　@book=Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end
  
  def update
      @user=User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(@user.id)
  end

  private
  def user_params
      params.require(:user) .permit(:name, :introduction, :profile_image)
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
