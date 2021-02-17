class SessionsController < ApplicationController
  def create
    user = User.
      find_by(email: params[:user][:email]).
      try(:authenitcate, params[:user][:password])

    if user.present?
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: {
        status: 401,
        logged_in: false,
        user: nil
      }
    end
  end
end
