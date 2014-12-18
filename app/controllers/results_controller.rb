class ResultsController < ApplicationController

  before_action :check_admin

  before_action :set_result, only: [:show, :edit, :update, :destroy]

  def index
    @results = Result.all
  end

  def show
  end

  def new
    @result = Result.new
    if params.has_key?(:problem_id)
      @result.problem_id = params[:problem_id]
    end
    if params.has_key?(:user_id)
      @result.user_id = params[:user_id]
    end
  end

  def edit
  end

  def create
    @result = Result.new(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to problem_lists_path, notice: 'Result was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to problem_lists_path, notice: 'Result was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url, notice: 'Result was successfully destroyed.' }
    end
  end

  private
  def set_result
    @result = Result.find(params[:id])
  end

  def result_params
    params.require(:result).permit(:status, :user_id, :problem_id)
  end
end
