class UsersController < ApplicationController
  def index
    @users=User.all
    @new_book=Book.new
  end

  def show
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
    redirect_to book_path(@book.id),notice: "You have creaated book successfully."
  end
  
  def update
      @user=User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(@user.id),notice: "You have updated profile successfully."
  end

  private
  def user_params
      params.require(:user) .permit(:name, :introduction, :profile_image)
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
