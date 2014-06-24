require 'sinatra/base'
require "active_support/all"

class API < Sinatra::Base
  get "/search" do
    handler = ElasticTwitter.new(params)
    handler.search.to_json
    # handler.to_json
  end
end