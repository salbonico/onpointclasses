class UsersController < ApplicationController

def new
	@user = User.new
end

def create
	@user = User.new(user_params)
	if @user.save
     session[:user_id] = @user.id
	 redirect_to "/home"
    else
      render :new
	end
	
end


def home
	
	if session[:user_id] == nil || session[:user_id] == ""
		redirect_to '/login' 
	else
	@user = User.find(session[:user_id])
	@online = @user.enrollments.online
	@classroom = @user.enrollments.classroom 
	end
end

private
 
  def user_params
    params.require(:user).permit(:name, :password, :email, :teacher, :admin)
  end



end