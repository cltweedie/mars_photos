require 'spec_helper'
describe MarsPhotos::Rover do
  let(:rover) { MarsPhotos::Rover.new("curiosity") }

  it "creates a curiosity rover" do
    expect(rover.name).to eq("curiosity")
  end

  describe '#get' do
    it "retrieves the photos in an array for a rover when given the sol" do
      VCR.use_cassette 'rover/get_sol' do
        sol = 1000
        response = rover.get(sol: sol)
        expect(response.class).to eq(Array)
        expect(response.first.keys.include?("img_src")).to be_truthy
        expect(response.first.keys.include?("camera")).to be_truthy
      end
    end

    it "retrieves photos in array for a rover when given the earth date" do
      VCR.use_cassette 'rover/get_earth_date' do
        earth_date = "2015-6-3"
        response = rover.get(earth_date: earth_date)
        expect(response.class).to eq(Array)
        expect(response.first.keys.include?("img_src")).to be_truthy
        expect(response.first.keys.include?("camera")).to be_truthy
      end
    end
  end
end
