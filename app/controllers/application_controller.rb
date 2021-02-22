class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :authenitcate

  private

  def authenitcate
    authenticate_or_request_with_http_token do |token, _options|
      User.find_by(token: token)
    end
  end

  def current_user
    @current_user || authenitcate
  end
end
