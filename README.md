# MarsPhotos

[![Gem Version](https://badge.fury.io/rb/mars_photos.svg)](https://badge.fury.io/rb/mars_photos) [![Test Coverage](https://codeclimate.com/github/cltweedie/mars_photos/badges/coverage.svg)](https://codeclimate.com/github/cltweedie/mars_photos/coverage)

A Ruby wrapper for NASAs Mars Rover Photos API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mars_photos'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mars_photos

## Usage

For basic usage, instantiate an API object either with or without an API key (if you don't provide one it will be set to the demo key, which allows for 30 requests per IP address per hour, and a maximum of 50 requests per day). Get an API key from NASA [here](https://api.nasa.gov/index.html#apply-for-an-api-key).

```ruby
@api = MarsPhotos::API.new # Sets API key to 'DEMO_KEY'
@api = MarsPhotos::API.new('YOUR_KEY_HERE')
```

Retrieve photos by rover and sol like this:

```ruby
@api.get(rover: 'curiosity', sol: 1000)
```

This returns an array of the photos, each with an `img_src` attribute.

You can provide an earth date in the format YYYY-MM-DD instead of a sol:

```ruby
@api.get(rover: 'curiosity', earth_date: '2015-6-3')
```

For photos from a specific camera, just specify a `cam` in the method's parameters:

```ruby
@api.get(rover: 'curiosity', sol: 1000, cam: 'fhaz')
```

You can call this method with a block:

```ruby
@api.get(rover: 'curiosity', sol: 1000) do |photo|
  puts photo['img_src']
end
```

You can also instantiate the Rover class:

```ruby
@curiosity = MarsPhotos::Rover.new('curiosity')

@curiosity.get(sol: 1000)
@curiosity.get(earth_date: '2015-6-3')

@curiosity.get_by_sol(1000)
@curiosity.get_by_earth_date('2015-6-3')
```

### Rovers

Images are available from three rovers:

  Rover        | Landing Date
  ------------ | ------------------------------
   Spirit      |  January 4, 2004
   Opportunity |  January 25, 2004
   Curiosity   |  August 6, 2012

### Sols

Sol is a time measurement representing the number of Martian solar days since the rover landed. It starts from 0.

### Cameras

Abbreviation | Camera                             | Curiosity | Spirit | Opportunity
------------ | -----------------------------------|-----------|--------|------------
 FHAZ        |  Front Hazard Avoidance Camera     |  &#10003; |&#10003;|&#10003;
 RHAZ        |  Rear Hazard Avoidance Camera      |  &#10003; |&#10003;|&#10003;
 MAST        |  Mast Camera                       |  &#10003; |        |
 CHEMCAM     |  Chemistry and Camera Complex      |  &#10003; |        |
 MAHLI       |  Mars Hand Lens Imager             |  &#10003; |        |
 MARDI       |  Mars Descent Imager               |  &#10003; |        |
 NAVCAM      |  Navigation Camera                 |  &#10003; |&#10003;|&#10003;
 PANCAM      |  Panoramic Camera                  |           |&#10003;|&#10003;
 MINITES     |  Mini Thermal Emission Spectrometer|           |&#10003;|&#10003;

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cltweedie/mars_photos.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

