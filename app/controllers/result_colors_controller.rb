class ResultColorsController < ApplicationController
  before_action :set_result_color, only: [:show, :edit, :update, :destroy]

  # GET /result_colors
  # GET /result_colors.json
  def index
    @result_colors = ResultColor.all
  end

  # GET /result_colors/1
  # GET /result_colors/1.json
  def show
  end

  # GET /result_colors/new
  def new
    @result_color = ResultColor.new
  end

  # GET /result_colors/1/edit
  def edit
  end

  # POST /result_colors
  # POST /result_colors.json
  def create
    if params.has_key?(:color)
      params[:color] = params[:color].to_i
    end
    @result_color = ResultColor.new(result_color_params)

    respond_to do |format|
      if @result_color.save
        format.html { redirect_to @result_color, notice: 'Result color was successfully created.' }
        format.json { render :show, status: :created, location: @result_color }
      else
        format.html { render :new }
        format.json { render json: @result_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /result_colors/1
  # PATCH/PUT /result_colors/1.json
  def update
    respond_to do |format|
      if @result_color.update(result_color_params)
        format.html { redirect_to @result_color, notice: 'Result color was successfully updated.' }
        format.json { render :show, status: :ok, location: @result_color }
      else
        format.html { render :edit }
        format.json { render json: @result_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /result_colors/1
  # DELETE /result_colors/1.json
  def destroy
    @result_color.destroy
    respond_to do |format|
      format.html { redirect_to result_colors_url, notice: 'Result color was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_result_color
    @result_color = ResultColor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def result_color_params
    params.require(:result_color).permit(:word, :red, :green, :blue)
  end
end
