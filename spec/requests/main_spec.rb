require 'rails_helper'

describe "GET /ping", type: :request do
  it "should output in json_api_format" do
    get "/ping", format: :json
    expect(response.status).to eq(200)
    response_body = JSON.parse(response.body)
    expect(response_body["data"][0]["type"]).to eq("responses")
    expect(response_body["data"][0]["attributes"]["pong"]).to eq(true)
  end
end