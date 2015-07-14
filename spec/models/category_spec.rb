require 'spec_helper'

describe Category do
  it "saves itself" do
    category = Category.new(name: "comedies")
    category.save
    expect(Category.first).to eq(category)
  end

  it "has many videos" do
  	comedies = Category.create(name: "comedies")
  	silicon_valley = Video.create(title: "Silicon Valley", desciption: "Funny start up life", category: comedies)
  	futurama = Video.create(title: "Futurama", desciption: "Space travel", category: comedies)
  	expect(comedies.videos).to eq([silicon_valley, futurama])
  end
end