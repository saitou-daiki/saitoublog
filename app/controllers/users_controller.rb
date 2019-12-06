class UsersController < ApplicationController
  def index
      redirect_to new_user_registration_path

  end

def show
  redirect_to new_user_registration_path

end

  def edit
    
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
