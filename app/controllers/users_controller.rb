class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show; end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def sign_up
    find_user
    @user = User.new(user_params) unless @user.present?
    @address = Address.new(address_params.to_h.merge(user: @user)) if @user.save
    @order = Order.new(order_params.to_h.merge(user: @user)) if @address.save
    render :show, status: :created, location: @user if @order.save
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def find_user
    @user = User.find_by(email: user_params[:email])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params
      .require(:user)
      .permit(:name, :email, :cpf, :born_date, :phone_1, :phone_2)
  end

  def address_params
    params
      .require(:address)
      .permit(:street, :cep, :number, :complement, :district, :unity_number)
  end

  def order_params
    params
      .require(:order)
      .permit(:plan_id)
  end
end
