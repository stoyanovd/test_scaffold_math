class ProblemsController < ApplicationController
  include UsersHelper

  before_action :check_user
  before_action :set_problem, only: [:show, :edit, :update, :destroy]


  def index
    @problems = Problem.all
  end

  def show
  end

  def new
    @problem = Problem.new
    if params.has_key?(:problem_list_id)
      @problem.problem_list_id = params[:problem_list_id]
    end
  end

  def edit
  end

  def create
    @problem = Problem.new(problem_params)
    respond_to do |format|
      if @problem.save
        format.html { redirect_to @problem, notice: 'Problem was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @problem.update(problem_params)
        format.html { redirect_to @problem, notice: 'Problem was successfully updated.' }
        format.json { render :show, status: :ok, location: @problem }
      else
        format.html { render :edit }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @problem.destroy
    respond_to do |format|
      format.html { redirect_to problems_url, notice: 'Problem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_problem
    @problem = Problem.find(params[:id])
  end

  def problem_params
    params.require(:problem).permit(:number, :body, :problem_list_id, :figure)
  end
end
