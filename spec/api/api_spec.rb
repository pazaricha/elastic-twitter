require "spec_helper"

describe API do
  it "searches and shit" do
    get "/search", {q: {terms: ["1","2","3"]}}
    p last_response.body
    expect(last_response.status).to eq 200
  end
end