require 'pry'
require 'httparty'
require 'dotenv/load'

require_relative "london_spas/version"
require_relative "london_spas/cli"
require_relative "london_spas/api"
require_relative "london_spas/spa"

module LondonSpas
  class Error < StandardError; end
  # Your code goes here...
end
