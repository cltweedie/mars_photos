require 'spec_helper'

describe MarsPhotos do
  let(:mp) { MarsPhotos.new }
  let (:first_image) { "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FLB_486265257EDR_F0481570FHAZ00323M_.JPG" }

  it 'has a version number' do
    expect(MarsPhotos::VERSION).not_to be nil
  end

  it 'returns an array of photos' do
    photos = mp.get(rover: 'curiosity', sol: 1000, cam: 'fhaz')

    expect(photos.length).to be > 0
    expect(photos.first['img_src']).to eq first_image
  end

  context "when a block is supplied" do
    it "yields the array of photos" do
      photos = []
      mp.get(rover: 'curiosity', sol: 1000, cam: 'fhaz') { |photo| photos << photo['img_src'] }

      expect(photos.first).to eq first_image
    end
  end
end
