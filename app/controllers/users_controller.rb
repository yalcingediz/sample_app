class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	#debugger
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)  # Not the final implementation!
  	if @user.save
  		# Handle successful save
  		log_in @user
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to @user    # same as redirect_to user_url(@user)
  	else
  		render 'new'
  	end
  end

  def destroy
    log_out 
    redirect_to root_url
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, 
  									 :password_confirmation) 				
  	end

end
