require "./api/api.rb"
require "./lib/elastic_twitter.rb"

require 'rack/test'

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods
  def app() API end
end

# For RSpec 2.x
RSpec.configure { |c| c.include RSpecMixin }
