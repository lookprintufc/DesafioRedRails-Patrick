class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_user

  def get_user
    @user = current_user || nil
  end

end
