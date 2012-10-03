class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
      root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    return login_path
  end
end