class UsersController < ApplicationController
  before_action :set_user, only: [:update, :delete, :from, :show_fullname]
  after_action :clear_cache, only: [:update]

  # GET /users
  def index
    @users = User.all
    render json: UserSerializer.new(@users).serializable_hash.to_json
  end

  # GET /users/count
  def count
    @users = User.all
    render json: @users.count, status: 200
  end

  # GET /users/1
  def show
    @user = Rails.cache.fetch("#{params[:id]}_cache", expires_in: 10.minute ) do
      User.find(params[:id])
    end
    if @user
      options = {}
      options[:is_collection] = false
      render json: UserSerializer.new(@user, options).serializable_hash.to_json, status: :ok
    else
      render json: { error: "User not found" }, status: 404
    end
  end

  # GET /users/:id/full_name
  def show_fullname
    if @user
      fullname = "#{@user[:first_name]} #{@user[:last_name]}"
      render json: fullname, status: 200
    else
      render json: { error: "User not found" }, status: 404
    end
  end

  # POST /users
  def create
    @user = User.create!(user_params)
      if @user
    render json: @user, status: :created
    else
      render json: { error: "User not created:" +  @user }, status: 404
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(update_user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH /users/1/grow
  def age_grow
    render json: IncrementUserAgeJob.perform_later(params[:id])
  end

  # DELETE /users/1
  def destroy
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
    if @user
      if @user.region == "hong_kong" || @user.region == "taiwan" || @user.region == "china"
        region = Object.const_get ("Region::"+@user.region.gsub("_"," ").titleize.gsub(" ","") + "Service")
        render json: region.new(@user).call, status: 200
      else
        render json: "I am not from China, Taiwan or Hong Kong", status: 200
      end
    else
      render json: { error: "User not found" }, status: 404
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Clear cache
    def clear_cache
      Rails.cache.delete("#{params[:id]}_cache")
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
