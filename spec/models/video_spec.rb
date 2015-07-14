require 'spec_helper'

describe Video do
  it "saves itself" do
    video = Video.new(title: "Monk")
    video.save
    expect(Video.first).to eq(video) 
  end

  it "belongs to a category" do
    dramas = Category.create(name: dramas)
    monk = Video.create(title: "Monk", desciption: "detective mind reader", category: dramas)
    expect(monk.category).to eq(dramas)
  end
end