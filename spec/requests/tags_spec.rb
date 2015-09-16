require 'rails_helper'

describe "POST /tags", type: :request do
  let(:user) { FactoryGirl.create(:user, email: 'email@sample.com', password: 'password') }
  let!(:params) {{ joke_id: 1, tag: "funny" }}

  it "should create a tag with valid parameters" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    post "/tags", params.merge({format: :json})
    response_body = JSON.parse(response.body)
    expect(response_body["joke_id"]).to eq(1)
    expect(response_body["tag"]).to eq("funny")
  end

  it "should not create a tag with missing data" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    post "/tags", {joke_id: 1}.merge({format: :json})
    expect(response.status).to eq(400)
    post "/tags", {tag: "tag only"}.merge({format: :json})
    expect(response.status).to eq(400)
    post "/tags", format: :json
    expect(response.status).to eq(400)
  end

  it "should only respond to JSON requests" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    post "/tags", {format: :xml}, params
    expect(request.format).to eq("application/xml")
    expect(response.status).to eq(406)
    post "/tags", {format: :html}, params
    expect(request.format).to eq("text/html")
    expect(response.status).to eq(406)
  end
end

describe "PATCH /tags", type: :request do
  let(:user) { FactoryGirl.create(:user, email: 'email@sample.com', password: 'password') }
  let(:tag) { FactoryGirl.create(:tag, joke_id: 1, tag: "funny") }

  it "should update a tag with valid parameters" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    patch "/tags/#{tag.id}", {tag: "not funny"}.merge({format: :json})
    tag.reload
    expect(tag.tag).to eq("not funny")
  end

  it "should not update a tag with missing data" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    patch "/tags/#{tag.id}", {tag: nil}.merge({format: :json})
    expect(response.status).to eq(400)
  end

  it "should only respond to JSON requests" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    patch "/tags/#{tag.id}", {format: :xml}, {tag: "not funny"}
    expect(request.format).to eq("application/xml")
    expect(response.status).to eq(406)
    patch "/tags/#{tag.id}", {format: :html}, {tag: "not funny"}
    expect(request.format).to eq("text/html")
    expect(response.status).to eq(406)
  end
end

describe "DELETE /tags", type: :request do
  let(:user) { FactoryGirl.create(:user, email: 'email@sample.com', password: 'password') }
  let!(:tag) { FactoryGirl.create(:tag, joke_id: 2, tag: "delete me") }

  it "should delete a tag" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    count = Tag.count
    delete "/tags/#{tag.id}", format: :json
    expect(Tag.count).to eq(count - 1)
  end

  it "should only respond to JSON requests" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    delete "/tags/#{tag.id}", format: :xml
    expect(request.format).to eq("application/xml")
    expect(response.status).to eq(406)
    delete "/tags/#{tag.id}", format: :html
    expect(request.format).to eq("text/html")
    expect(response.status).to eq(406)
  end
end

