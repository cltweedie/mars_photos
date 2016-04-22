require 'spec_helper'
require 'pry'
describe MarsPhotos::Rover do
  let(:rover) { MarsPhotos::Rover.new("curiosity") }

  it "creates a curiosity rover" do
    expect(rover.name).to eq("curiosity")
  end

  describe '#get' do
    context 'when sol is provided' do
      it "retrieves the photos in an array for a rover when given the sol" do
        VCR.use_cassette 'rover/get_sol' do
          sol = 1000
          response = rover.get(sol: sol)
          expect(response.class).to eq(Array)
          expect(response.first.keys.include?("img_src")).to be_truthy
          expect(response.first.keys.include?("camera")).to be_truthy
        end
      end
      context 'pagination' do
        it "gives the results for a page" do
          VCR.use_cassette 'rover/get_sol_page' do
            sol = 1000
            page = 5
            response = rover.get(sol: sol, page: page)
            expect(response.first['id']).to eq(425421)
            expect(response.first['camera']['name']).to eq("MAST")
          end
        end
      end
    end
    context 'when earth_date is provided' do
      it "retrieves photos in array for a rover when given the earth date" do
        VCR.use_cassette 'rover/get_earth_date' do
          earth_date = "2015-6-3"
          response = rover.get(earth_date: earth_date)
          expect(response.class).to eq(Array)
          expect(response.first.keys.include?("img_src")).to be_truthy
          expect(response.first.keys.include?("camera")).to be_truthy
        end
      end
      context 'pagination' do
        it "gives the results for a page" do
          VCR.use_cassette 'rover/get_earth_date_page' do
            earth_date = "2014-6-3"
            page = 5
            response = rover.get(earth_date: earth_date, page: page)
            expect(response.first['id']).to eq(37941)
            expect(response.first['camera']['name']).to eq("NAVCAM")
          end
        end
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
