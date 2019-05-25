class UsersController < ApplicationController
  def new
    # Create an empty user object that can be filled by the form in view
    @user = User.new
  end

  def show
    # we need to instantiate @user to be able to use it in the view file
    @user = User.find(params[:id])
    #functionality provided by bye bug
    #debugger
  end

  # iff a post request is redirected to /users then create fucntion is invoked. (RESTful Design)
  def create
    @user = User.new(user_param)
    if @user.save
      # Handle a successful save.
      #
      #flash is actually a method that we can treat like a hash
      flash[:success] = "Welcome to the sample App"
      # how is it redirecting to /users/show magic?
      redirect_to user_url(@user)

    else
      render 'new'
    end
  end

  private
    # Security : makes sure only the valid and required fields are supplied no any other field
    def user_param
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
