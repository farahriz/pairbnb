class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit]

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
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    byebug
    if @user.save
      sign_in @user
      redirect_to root_path
    else
      redirect back
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :handle, :first_name, :last_name, :password, :avatar)
    end

    def set_user
      @user = User.find(params[:id])
    end
  
end