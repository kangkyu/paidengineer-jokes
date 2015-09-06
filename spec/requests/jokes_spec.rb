require 'rails_helper'

describe 'jokes', type: :request do
  let(:user) { FactoryGirl.create(:user, email: 'email@sample.com', password: 'password') }
  let(:joke) { FactoryGirl.create(:joke, body: 'Two programmers walked into a bar') }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    get "/jokes/#{joke.id}", nil, headers
  end

  it 'should get a collection of jokes' do
    response_body = JSON.parse(response.body)
    expect(response_body['body']).to eq(joke.body)
  end
end

describe "GET /jokes", type: :request do
  let(:user) { FactoryGirl.create(:user, email: 'email@sample.com', password: 'password') }

  it "should output in JSON API format" do
    joke1 = FactoryGirl.create(:joke, body: "First joke")
    joke2 = FactoryGirl.create(:joke, body: "Second joke")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    get "/jokes", format: :json
    response_body = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(response_body).to include("data")

    first_joke = response_body['data'][0]
    expect(first_joke["type"]).to eq("jokes")
    expect(first_joke["attributes"]["body"]).to eq(joke1.body)

    second_joke = response_body['data'][1]
    expect(second_joke["type"]).to eq("jokes")
    expect(second_joke["attributes"]["body"]).to eq(joke2.body)
  end
end

