class UsersController < ActionController::Base
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Account created successfully!"
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully created account and logged in!'
    else
      redirect_to root_path, alert: "Oops, couldn't create account. Please make sure you are using a valid name and password and try again."
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end