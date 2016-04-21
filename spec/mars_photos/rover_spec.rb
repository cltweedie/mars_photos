require 'spec_helper'

describe MarsPhotos::Rover do
	let(:rover) { MarsPhotos::Rover.new("curiosity") }

	it "creates a curiosity rover" do
		expect(rover.name).to eq("curiosity")
	end

	it "retrieves the photos for a rover when give sol" do
		sol = 1000
		expect(rover.get(sol)).not_to be_nil
	end
end
