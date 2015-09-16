class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  # before_action :ensure_json_request

  def ensure_json_request
    return if request.format == :json
    render :nothing => true, :status => 406
  end

  def ensure_current_user
    render json: '404', status: 404 if current_user.blank?
  end

  def session_id
    header_value = request.headers['Authorization']
    match = /^Auth (.*)/.match(header_value)
    match && match[1]
  end

  def current_user
    return unless session = Session.find_by_token(session_id)
    if user_id = session.user_id
      @current_user ||= User.find(user_id)
    end
  end
end
