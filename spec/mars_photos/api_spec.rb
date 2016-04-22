require 'spec_helper'

describe MarsPhotos::API do
  let(:mp) { MarsPhotos::API.new }
  let (:first_image) { "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FLB_486265257EDR_F0481570FHAZ00323M_.JPG" }

  it 'has a version number' do
    expect(MarsPhotos::VERSION).not_to be nil
  end

  describe '#get' do
    context 'when a rover, sol and cam is provided' do
      it 'returns an array of photos' do
        photos = mp.get(rover: 'curiosity', sol: 1000, cam: 'fhaz')

        expect(photos.length).to be > 0
        expect(photos.first['img_src']).to eq first_image
      end
    end

    context 'when a rover, earth date and cam is provided' do
      it 'returns an array of photos' do
        photos = mp.get(rover: 'curiosity', earth_date: '2015-6-3', cam: 'fhaz')

        expect(photos.length).to be > 0
        expect(photos.first['img_src']).not_to be_nil
      end
    end

    context 'when a rover and sol is provided' do
      it 'returns an array of photos' do
        photos = mp.get(rover: 'curiosity', sol: 1000)

        expect(photos.length).to be > 0
        expect(photos.first['img_src']).not_to be_nil
      end
    end

    context 'when no sol or earthdate is provided' do
      it 'raises an error' do
        expect{ mp.get(rover: 'curiosity') }.to raise_error "You must provide a sol or earth date"
      end
    end

    context 'when a block is supplied' do
      it 'yields the array of photos' do
        photos = []
        mp.get(rover: 'curiosity', sol: 1000, cam: 'fhaz') { |photo| photos << photo['img_src'] }

        expect(photos.first).to eq first_image
      end
    end
  end

  describe '#new' do
    let(:api_with_key) { MarsPhotos::API.new('12345') }
    let(:api_without_key) { MarsPhotos::API.new }

    it 'sets the API key on the instance when one is provided' do
      expect(api_with_key.key).to eq '12345'
    end

    it 'uses the default demo key when one is not provided' do
      expect(api_without_key.key).to eq 'DEMO_KEY'
    end
  end
end
