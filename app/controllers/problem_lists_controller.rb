class ProblemListsController < ApplicationController
  include UsersHelper
  before_action :check_user, except: [:show, :index]
  before_action :set_problem_list, only: [:show, :edit, :update, :destroy]

  def index
    @problem_lists = ProblemList.all
  end

  def show
  end

  def new
    @problem_list = ProblemList.new
  end

  def edit
  end

  def logout
    reset_session
    redirect_to problem_lists_path
  end

  def create
    @problem_list = ProblemList.new(problem_list_params)

    respond_to do |format|
      if @problem_list.save
        format.html { redirect_to @problem_list, notice: 'Problem list was successfully created.' }
        format.json { render :show, status: :created, location: @problem_list }
      else
        format.html { render :new }
        format.json { render json: @problem_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @problem_list.update(problem_list_params)
        format.html { redirect_to @problem_list, notice: 'Problem list was successfully updated.' }
        format.json { render :show, status: :ok, location: @problem_list }
      else
        format.html { render :edit }
        format.json { render json: @problem_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @problem_list.destroy
    respond_to do |format|
      format.html { redirect_to problem_lists_url, notice: 'Problem list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_problem_list
    @problem_list = ProblemList.find(params[:id])
  end

  def problem_list_params
    params.require(:problem_list).permit(:title, :description)
  end


end
