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

  describe "#recent_videos" do
    it "returns the videos in the reverse chronological order by created at" do
      comedies = Category.create(name: "comedies")
      futurama = Video.create(title: "Futurama", desciption: "space travel", category: comedies)
      south_park = Video.create(title: "South Park", desciption: "racist children", category: comedies)
      expect(comedies.recent_videos).to eq([south_park, futurama])
    end
    it "returns all the videos if there are less than 6 videos" do
      comedies = Category.create(name: "comedies")
      futurama = Video.create(title: "Futurama", desciption: "space travel", category: comedies)
      south_park = Video.create(title: "South Park", desciption: "racist children", category: comedies)
      expect(comedies.recent_videos.count).to eq(2)
    end
    it "returns six videos if there are more than six videos" do
      comedies = Category.create(name: "comedies")
      7.times { Video.create(title: "foo", desciption: "bar", category: comedies)}
      expect(comedies.recent_videos.count).to eq(6)
    end
    it "returns the most recent 6 videos" do
      comedies = Category,create(name: "comedies")
      7.times { Video.create(title: "foo", desciption: "bar", category: comedies) }
      expect(comedies.recent_videos).to eq(Videos[0..5])
    end
    it "returns an empty array if there are no videos in the category" do
      comedies = Category.create(name: "comedies")
      expect(comedies.recent_videos).to eq([])
    end
  end
end