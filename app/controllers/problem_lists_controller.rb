class ProblemListsController < ApplicationController
  before_action :set_problem_list, only: [:show, :edit, :update, :destroy]

  # GET /problem_lists
  # GET /problem_lists.json
  def index
    @problem_lists = ProblemList.all
  end

  # GET /problem_lists/1
  # GET /problem_lists/1.json
  def show
  end

  # GET /problem_lists/new
  def new
    @problem_list = ProblemList.new
  end

  # GET /problem_lists/1/edit
  def edit
  end

  # POST /problem_lists
  # POST /problem_lists.json
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

  # PATCH/PUT /problem_lists/1
  # PATCH/PUT /problem_lists/1.json
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

  # DELETE /problem_lists/1
  # DELETE /problem_lists/1.json
  def destroy
    @problem_list.destroy
    respond_to do |format|
      format.html { redirect_to problem_lists_url, notice: 'Problem list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem_list
      @problem_list = ProblemList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def problem_list_params
      params.require(:problem_list).permit(:title, :description)
    end



  # layout :resolve_layout
  # def resolve_layout
  #   logger.debug action_name
  #   case action_name
  #     when "new", "create", "edit", "update"
  #       "application_without_footer"
  #     else
  #       "application"
  #   end
  # end

end
