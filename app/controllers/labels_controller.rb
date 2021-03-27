class LabelsController < ApplicationController
  GMAIL_BASE_USER_URL = 'https://gmail.googleapis.com/gmail/v1/users'.freeze

  def fetch_labels
    params.require(%i[user_id access_token])
    params.permit(:user_id, :access_token)
    response = get_labels_data(params[:email], params[:access_token])

    Rails.logger.info(response)
    render json: response
  end

  private

  def get_labels_data(email, bearer_token)
    headers = {
      content_type: 'application/json',
      accept: "application/json",
      "Authorization": "Bearer #{bearer_token}"
  }
    url = GMAIL_BASE_USER_URL + "/#{email}/labels"
    body = {}.to_json

    client.run_request(:get, url, body, headers)
  end

  def client
    @_client ||= Faraday.new
  end
end
