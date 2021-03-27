class LoginController < ApplicationController
  VERIFY_REFRESH_TOKEN_URL = 'https://www.googleapis.com/oauth2/v4/token'.freeze

  def verify_user
    params.require(%i[email password])
    params.permit(:email, :password)

    user = User.find_by(email: params[:email])
    if user.nil?
      render json: { status: 400, error: 'Invalid email or password' }.to_json
      return
    end

    if params[:password] != user.password
      render json: { status: 400, error: 'Invalid email or password' }.to_json
      return
    end
    response = verify_refresh_token(user.refresh_token)
    # body = JSON.parse(response.body)
    # Rails.logger.debug(body["access_token"])
    render json: response
  end

  private

  def verify_refresh_token(refresh_token)
    # add google client_id and secret below
    body = {
      client_id: 'client_id',
      client_secret: 'client_secret',
      refresh_token: refresh_token,
      grant_type: 'refresh_token'
    }.to_json

    headers = {
      content_type: 'application/json'
    }

    client.run_request(:post, VERIFY_REFRESH_TOKEN_URL, body, headers)
  end

  def client
    @_client ||= Faraday.new
  end
end
