# Mars::Photos

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/mars/photos`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mars-photos'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mars-photos

## Usage

To retrieve photos by providing the rover, sol and camera, you can use the `get` method on the MarsPhotos module:

```ruby
MarsPhotos.get(rover: 'curiosity', sol: 1000, cam: 'fhaz')
```

This returns an array of the photos, each with an `img_src` attribute.

You can also call this method and provide a block:

```ruby
MarsPhotos.get(rover: 'curiosity', sol: 1000, cam: 'fhaz') do |photo|
  puts photo['img_src']
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mars-photos.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

