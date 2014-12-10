class ResultColorsController < ApplicationController

  include UsersHelper
  before_action :check_user
  before_action :set_result_color, only: [:show, :edit, :update, :destroy]

  def index
    @result_colors = ResultColor.all
  end

  def show
  end

  def new
    @result_color = ResultColor.new
  end

  def edit
  end

  def create
    if params.has_key?(:color)
      params[:color] = params[:color].to_i
    end
    @result_color = ResultColor.new(result_color_params)

    respond_to do |format|
      if @result_color.save
        format.html { redirect_to @result_color, notice: 'Result color was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @result_color.update(result_color_params)
        format.html { redirect_to @result_color, notice: 'Result color was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @result_color.destroy
    respond_to do |format|
      format.html { redirect_to result_colors_url, notice: 'Result color was successfully destroyed.' }
    end
  end

  private
  def set_result_color
    @result_color = ResultColor.find(params[:id])
  end

  def result_color_params
    params.require(:result_color).permit(:word, :red, :green, :blue)
  end
end
