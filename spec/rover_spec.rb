require 'spec_helper'

describe MarsPhotos::Rover do
	let(:rover) { MarsPhotos::Rover.new("curiosity") }

	it "creates a curiosity rover" do
		expect(rover.name).to eq("curiosity")
	end
end
