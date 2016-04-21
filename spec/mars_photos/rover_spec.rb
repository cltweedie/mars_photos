require 'spec_helper'

describe MarsPhotos::Rover do
  let(:rover) { MarsPhotos::Rover.new("curiosity") }

  it "creates a curiosity rover" do
    expect(rover.name).to eq("curiosity")
  end

  describe '#get' do
    it "retrieves the photos in an array for a rover when given the sol" do
      sol = 1000
      response = rover.get(sol)
      expect(response.class).to eq(Array)
      expect(response.first.keys.include?("img_src")).to be_truthy
      expect(response.first.keys.include?("camera")).to be_truthy
    end
  end
end
