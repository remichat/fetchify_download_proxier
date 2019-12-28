class Api::V1::TransfersController < ApplicationController
  protect_from_forgery

  def create
    body = {
      q: params[:q],
      page: params[:page]
    }
    url = ENV['DOWNLOAD_URL']
    response_call = RestClient.post(url, body)
    response_json = { response: response_call }
    render json: response_json.to_json
  end
end
