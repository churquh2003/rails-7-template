class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    return new_consent_path unless resource.consented?

    user_emails_path
  end

  def after_sign_up_path_for(resource)
    return new_consent_path unless resource.consented?

    user_emails_path
  end
end

