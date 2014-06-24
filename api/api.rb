require 'sinatra/base'

class API < Sinatra::Base
  get "/search" do
    handler = ElasticTwitter.new(params[:q])
    handler.to_json
  end
end