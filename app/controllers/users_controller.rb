class UsersController < ApplicationController
  # Create a new User
  def create
    user = User.create!(
      username: params[:user][:username],
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation],
      token: SecureRandom.hex(20)
    )

    if user.present?
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: {
        status: 500,
        logged_in: false,
        user: nil
      }
    end
  end

  def login
    user = User.
      find_by(email: params[:user][:email]).
      try(:authenitcate, params[:user][:password])

    if user.present?
      render json: {
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
