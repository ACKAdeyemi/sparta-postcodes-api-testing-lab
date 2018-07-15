require 'httparty'
require 'json'
require 'rspec'

require_relative '../postcode.rb'


RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end
