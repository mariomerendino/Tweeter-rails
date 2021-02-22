class UsersController < ApplicationController
  skip_before_action :authenitcate, only: [:login]
  # Create a new User
  def create
    user = User.create!(
      username: params[:user][:username],
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation],
      token: SecureRandom.hex(20)
    )

    if user
      render json: { status: :created, user: user }
    else
      render json: { status: 500, user: nil }
    end
  end

  def login
    user = User.find_by(email: params[:user][:email])
    user&.authenticate(params[:user][:password])

    if user
      user.update_attribute(:token, SecureRandom.hex(20))
      render json: { user: user }
    else
      render json: { status: 401, user: nil }
    end
  end
end
