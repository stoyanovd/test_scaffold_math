module UsersHelper

  def check_user
    unless session.has_key?(:current_user_id) && session[:current_user_id]
      respond_to do |format|
        format.html { redirect_to problem_lists_path, notice: 'Login please.' }
      end
    end
  end

end
