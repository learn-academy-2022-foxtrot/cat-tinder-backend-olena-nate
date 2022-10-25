require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate name exists in the db entry" do
    cat = Cat.create(age: 13, enjoys: "sleeping and eating", image:"https://media.wired.co.uk/photos/60c8730fa81eb7f50b44037e/3:2/w_3329,h_2219,c_limit/1521-WIRED-Cat.jpeg")
    expect(cat.errors[:name]).to_not be_empty
  end

  it "should validate age exists in the db entry" do
    cat = Cat.create(name: "Max", enjoys: "sleeping and eating", image:"https://media.wired.co.uk/photos/60c8730fa81eb7f50b44037e/3:2/w_3329,h_2219,c_limit/1521-WIRED-Cat.jpeg")
    expect(cat.errors[:age]).to_not be_empty
  end

  it "should validate enjoys exists in the db entry" do
    cat = Cat.create(name: "Max", age: 13, image:"https://media.wired.co.uk/photos/60c8730fa81eb7f50b44037e/3:2/w_3329,h_2219,c_limit/1521-WIRED-Cat.jpeg")
    expect(cat.errors[:enjoys]).to_not be_empty
  end

  it "should validate image exists in the db entry" do
    cat = Cat.create(name: "Max", age: 13, enjoys: "sleeping and eating")
    expect(cat.errors[:image]).to_not be_empty
  end

  it "should validate enjoys is at least 10 characters long" do
    cat = Cat.create(name: "Max", age: 13, enjoys: "eating", image:"https://media.wired.co.uk/photos/60c8730fa81eb7f50b44037e/3:2/w_3329,h_2219,c_limit/1521-WIRED-Cat.jpeg")
    expect(cat.errors[:enjoys]).to_not be_empty
  end
end
