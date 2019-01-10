class UsersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  # def update
  #   user = current_account.people.find(params[:id])
  #   user.update!(user_params)
  #   redirect_to user
  # end


  def new
  	# byebug
    @user = User.new(user_params)
    render template: "users/new"
  end

  def create
  	# byebug
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :handle, :first_name, :last_name, :password)
    end
  
end