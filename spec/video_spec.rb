require 'spec_helper'

describe Video do 
  it "saves itslef" do
    video = Video.new(title: "monk", description: "a great video!")
    video.save
    #Rspec team's favored way of writing this test
    expect(Video.first).to eq(video)

    #Can also write this test in the following two manners
    #1. Video.first.should==video
    #2. Video.first.should eq(video)
  end
end
