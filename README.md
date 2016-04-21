# MarsPhotos

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

To retrieve photos by providing the rover, sol and camera, you can use the `get` method on the MarsPhotos module:

```ruby
MarsPhotos.get(rover: 'curiosity', sol: 1000, cam: 'fhaz')
```

This returns an array of the photos, each with an `img_src` attribute.

You can also call this method with a block:

```ruby
MarsPhotos.get(rover: 'curiosity', sol: 1000, cam: 'fhaz') do |photo|
  puts photo['img_src']
end
```

You can also instantiate the Rover class:

```ruby
@curiosity = MarsPhotos::Rover.new

@curiosity.get(1000) # retrieves photos taken by curiosity on sol 1000
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cltweedie/mars-photos.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

