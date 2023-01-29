class Api::V1::AuthenticationController < ApplicationController
  # frozen_string_literal: true

  skip_before_action :authenticate_request

  # POST authentication/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'invalid credentials' }, status: :unauthorized
    end
  end
end
