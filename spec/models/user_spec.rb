require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(first_name: "Test Test",
      last_name: "Test Test",
      region: "hong_kong",
      age: 30)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without age" do
    subject.age = nil
    expect(subject).to_not be_valid
  end
  it "is valid with age = 0" do
    subject.age = 0
    expect(subject).to be_valid
  end
  it "is not valid with age < 1" do
    subject.age = -1
    expect(subject).to_not be_valid
  end

  it "is valid with region hong_kong,taiwan and china" do
    subject.region = 'hong_kong'
    expect(subject).to be_valid
    subject.region = 'taiwan'
    expect(subject).to be_valid
    subject.region = 'china'
    expect(subject).to be_valid
  end
  it "is not valid without region" do
    subject.region = nil
    expect(subject).to_not be_valid
  end
  it "is not valid with region not in hong_kong,taiwan and china " do
    subject.region = 'asdasdadfs'
     expect(subject).to_not be_valid
  end

end
