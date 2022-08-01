require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/users"
      # check the http status of the response
      expect(response).to have_http_status(:ok)
      # raise response.body 
    end
  end

  describe "POST /user" do
    it "returns http 201" do
      post "/users", params: {
        user: {  
          "first_name": "Tai Tai",
          "last_name": "Chan Chan",
          "region": "hong_kong",
          "age": 30
        }
      }
      expect(response).to have_http_status(:created)
    end
  end

  describe "GET /user/:userId" do
    it "returns http 200" do
      get "/users/62e743a1ce9fb70f75b09fdc" 
      # check the http status of the response
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /user/:userId" do
    it "returns http 404" do
      get "/users/2" 
      # check the http status of the response
      expect(response).to have_http_status(:not_found)
    end
  end
end
