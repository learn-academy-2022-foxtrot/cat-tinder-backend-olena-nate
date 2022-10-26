require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do 

      Cat.create(
        name: "Max",
        age: 13,
        enjoys: "eatind and sleeping",
        image: "https://media.wired.co.uk/photos/60c8730fa81eb7f50b44037e/3:2/w_3329,h_2219,c_limit/1521-WIRED-Cat.jpeg"
      )

      get '/cats'
      cat = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(cat.length).to eq(1)

    end
  end

describe "POST /create" do 
  it "creates a cat" do 
    cat_params = {
        cat: {
        name: "Max",
        age: 13,
        enjoys: "eating and sleeping",
        image: "https://media.wired.co.uk/photos/60c8730fa81eb7f50b44037e/3:2/w_3329,h_2219,c_limit/1521-WIRED-Cat.jpeg"
    }
  }

  post '/cats', params: cat_params
    cat = Cat.first

    expect(cat.name).to eq 'Max'
  end 
end 

describe "PATCH /update" do 
  it "update a certain cat" do 

    cat_params = {
        cat: {
        name: "Max",
        age: 13,
        enjoys: "eating and sleeping",
        image: "https://media.wired.co.uk/photos/60c8730fa81eb7f50b44037e/3:2/w_3329,h_2219,c_limit/1521-WIRED-Cat.jpeg"
    }
  }

  post '/cats', params: cat_params
    cat = Cat.first
    p "cat", cat

  update_cat_params = {
    cat: {
      name: "Boo",
      age: 13,
      enjoys: "eating and sleeping",
      image: "https://media.wired.co.uk/photos/60c8730fa81eb7f50b44037e/3:2/w_3329,h_2219,c_limit/1521-WIRED-Cat.jpeg"
    }
  }



  put "/cats/#{cat.id}", params: update_cat_params
  cat = Cat.first
  p "cat", cat

 expect(cat.name).to eq("Boo")
    
  end 
end 

describe "cannot create a cat without valid attributes" do
  it "doesn't create a cat without a name" do
    cat_params = {
      cat: {
        age: 13,
        enjoys: "eating and sleeping",
        image: "https://media.wired.co.uk/photos/60c8730fa81eb7f50b44037e/3:2/w_3329,h_2219,c_limit/1521-WIRED-Cat.jpeg"
      }
    }

  post '/cats', params: cat_params
  expect(response.status).to eq 422
  json = JSON.parse(response.body)
  expect(json['name']).to include "can't be blank"
  end
end
end
