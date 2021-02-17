class RegistrationsController < ApplicationController
  def create
    user = User.create!(
      username: params[:user][:username],
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation]
    )

    if user.present?
      session[:user_id] = user.id
      render json: {
        status: :created,
        user: user
      }
    else
      render json: {
        status: 500,
        user: nil
      }
    end
  end
end
