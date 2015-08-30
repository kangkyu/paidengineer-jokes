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