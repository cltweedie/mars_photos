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

  describe 'get_by_sol' do
    it "returns an array pictures by sol" do
      VCR.use_cassette 'rover/get_sol' do
        sol = 1000
        response = rover.get_by_sol(sol)
        expect(rover.respond_to? :get_by_sol).to be_truthy
        expect(response.class).to eq(Array)
        expect(response.first.keys.include?("img_src")).to be_truthy
        expect(response.first.keys.include?("camera")).to be_truthy
      end
    end
  end
  describe 'get_by_earth_date' do
    it "returns an array pictures by earth_date" do
      VCR.use_cassette 'rover/get_earth_date' do
        earth_date = '2015-6-3'
        response = rover.get_by_earth_date(earth_date)
        expect(rover.respond_to? :get_by_earth_date).to be_truthy
        expect(response.class).to eq(Array)
        expect(response.first.keys.include?("img_src")).to be_truthy
        expect(response.first.keys.include?("camera")).to be_truthy
      end
    end
  end

  describe 'get by sol and by cam' do
    it "returns an array of photos on a given sol and from a specific camera" do
      VCR.use_cassette 'rover/get_by_sol_and_cam' do
        sol = 1000
        cam = 'fhaz'
        response = rover.get(sol: sol, cam: cam)
        expect(response.class).to eq(Array)
        expect(response.first.keys.include?("img_src")).to be_truthy
        expect(response.first.keys.include?("camera")).to be_truthy
      end
    end
  end
end
