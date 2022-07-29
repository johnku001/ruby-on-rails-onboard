class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :delete, :from]

  # GET /users
  def index
    @users = User.all
    # render json: @users
    render json: UserSerializer.new(@users).serializable_hash.to_json
  end

  # GET /users/count
  def count
    @users = User.all
    render json: @users.count, status: 200
  end

  # GET /users/1
  def show
    render json: UserSerializer.new(@users.to_a)
  end

  # GET /users/:id/full_name
  def show_fullname
    @user = User.find(params[:id])
    fullname = "#{@user[:first_name]} #{@user[:last_name]}"
    render json: fullname, status: 200
  end

  # POST /users
  def create
    @user = User.create!(user_params)
    render json: @user
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(update_user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def delete
    if @user
      @user.destroy
      render json: {
        message: 'User deleted successfully'
     }, status: 200
    else
      render json: {
        error: 'Unable to delete User'
      }, status: 400
    end
  end

  # GET from region
  def from
    if @user.region == "hong_kong" || @user.region == "taiwan" || @user.region == "china"
      region = Object.const_get ("Region::"+@user.region.gsub("_"," ").titleize.gsub(" ","") + "Service")
      render json: region.new(@user).call

    else
      render json: "I am not from China, Taiwan or Hong Kong"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :age, :region)
    end

    # Only allow a trusted parameter "white list" through.
    def update_user_params
      params.require(:user).permit(:first_name, :age, :region)
    end    
end
