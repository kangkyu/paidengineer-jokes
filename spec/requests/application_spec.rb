require 'rails_helper'

describe "login", type: :request do
  let(:user) { FactoryGirl.create(:user, email: 'email@sample.com', password: 'password') }
  let(:params) {{ email: user.email, password: user.password }}

  it "should go through the login process" do
    joke1 = FactoryGirl.create(:joke, body: "First joke")

    post '/sessions', params
    response_body = JSON.parse(response.body)
    token = response_body['data']['attributes']['token']

    get '/jokes', { format: :json }, {'Authorization': "Auth #{token}" }
    jokes = JSON.parse(response.body)

    first_joke = jokes['data'][0]
    expect(first_joke["type"]).to eq("jokes")
    expect(first_joke["attributes"]["body"]).to eq(joke1.body)
  end
end

