class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def loggined
    session.has_key?(:current_user_id) && session[:current_user_id]
  end

  def cur_user_name
    unless loggined
      return nil
    end
    User.find(session[:current_user_id]).name
  end

  def cur_user_id
    unless loggined
      return nil
    end
    session[:current_user_id]
  end

  def adminned
    cur_user_name == "dima"
  end

  def check_user
    unless loggined
      respond_to do |format|
        format.html { redirect_to problem_lists_path, notice: 'Login please.' }
      end
    end
  end

  def check_admin
    unless adminned
      respond_to do |format|
        format.html { redirect_to problem_lists_path, notice: 'You must be admin.' }
      end
    end
  end

  helper_method :loggined
  helper_method :cur_user_name
  helper_method :cur_user_id
  helper_method :adminned
end
