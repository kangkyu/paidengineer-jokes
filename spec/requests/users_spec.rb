require 'rails_helper'

describe 'jokes', type: :request do
  let!(:admin) { FactoryGirl.create(:user, email: 'email@sample.com', password: 'password') }
  let!(:params) {{ email: 'newuser@example.com', password: 'password' }}

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    post '/users', params
  end

  it 'should create a user' do
    response_body = JSON.parse(response.body)
    expect(response_body['email']).to eq('newuser@example.com')
  end
end