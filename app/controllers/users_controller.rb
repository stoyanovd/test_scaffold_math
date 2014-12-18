class UsersController < ApplicationController
  include UsersHelper

  before_action :check_admin, except: [:try_enter, :show_sign_in, :new, :create]


  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  def show_sign_in
    logger.debug ("WWWW  show_sign_in" + @user.to_s + "  " +(@user != nil).to_s)
    respond_to do |format|
      format.html { render :'sign_in' }
    end
  end

  def try_enter
    logger.debug ("WWWW  try_enter" + @user.to_s + "  " + (@user != nil).to_s)

    current_user = User.find_by(name: params[:user][:name]).try(:authenticate, params[:user][:password])
    logger.debug ("WWWW  try_enter current " + current_user.to_s)
    respond_to do |format|
      if current_user
        session[:current_user_id] = current_user.id
        format.html { redirect_to problem_lists_path, notice: 'Login successfully.' }
      else
        format.html { redirect_to sign_in_users_path, alert: 'Login failed.' }
      end
    end
  end

  def self.get_cur_user(id)
    User.find(id)
  end

  private
  def set_user
    if params.has_key?(:id) && User.where(id: params[:id]).count > 0
      @user = User.find(params[:id])
    else
      @user = User.new
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
