require 'rails_helper'

describe 'sessions', type: :request do
  let(:user) { FactoryGirl.create(:user, email: 'email@sample.com', password: 'password') }
  let(:params) {{ email: user.email, password: user.password }}

  it 'should create a session' do
    post '/sessions', params
    body = JSON.parse(response.body)
    expect(body['data']['attributes']['token']).to_not be_nil
    expect(body['data']['attributes']['user_id']).to eq(1)
  end

  it "should not create a session if user is invalid" do
    post '/sessions'
    expect(response.status).to eq(400)
  end
end

