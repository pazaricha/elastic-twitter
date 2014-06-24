require "spec_helper"

describe API do
  it "searches and shit" do
    get "/search"
    expect(last_response.status).to eq 200
  end
end