require 'rails_helper'

describe 'sessions', type: :request do
  let(:user) { FactoryGirl.create(:user, email: 'email@sample.com', password: 'password') }
  let(:params) {{ email: user.email, password: user.password }}

  it 'should create a session' do
    post '/sessions', params
    body = JSON.parse(response.body)
    expect(body['token']).to_not be_nil
    expect(body['user_id']).to eq(1)
  end
end