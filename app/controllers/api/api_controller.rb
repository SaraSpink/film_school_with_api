module Api
  class ApiController < ApplicationController
    skip_before_action :verify_authenticity_token
    protect_from_forgery with: :null_session
    before_action :authenticate

    def authenticate
      authenticate_or_request_with_http_basic do |user, password|
        user == "phil" && password == "catspaw"
      end
    end
  end
end
