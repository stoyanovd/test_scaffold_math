class AnswersController < ApplicationController

  before_action :check_user
  before_action :check_admin, except: [:new, :create]
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def index
    @answers = Answer.all
  end

  def show
  end

  def new
    @answer = Answer.new
  end

  def edit
  end

  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        #NewAnswerMailer.get_new_answer(@user).deliver_later
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def answer_params
    logger.debug "WWWWW"
    if params.has_key?(:problem_number)
      params[:answer][:problem_id] = Problem.find_by_number(params[:problem_number]).id
    end
    if params.has_key?(:user_name)
      params[:answer][:user_id] = User.find_by_name(params[:user_name]).id
    end
    params.require(:answer).permit(:body, :problem_id, :user_id)
  end
end
