class UsersController < ApplicationController
  def index
    redirect_to new_user_registration_path
  end
  
  def edit
  end

  def update
    user = User.find(current_user.id)
    if user.update(user_params)
      redirect_to '/messages/index'
    else
      redirect_to "/users/#{current_user.id}/edit"
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
