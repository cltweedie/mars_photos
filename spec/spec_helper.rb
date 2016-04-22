$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
SimpleCov.start
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require 'mars_photos'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
  c.ignore_hosts 'codeclimate.com'
end
