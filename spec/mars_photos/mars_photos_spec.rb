require 'spec_helper'

describe MarsPhotos do
  let(:mp) { MarsPhotos.new }

  it 'has a version number' do
    expect(MarsPhotos::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(mp.get(rover: 'curiosity', sol: 1000, cam: 'fhaz')).not_to be_nil
  end
end
