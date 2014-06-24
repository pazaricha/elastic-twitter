require "spec_helper"

describe API do
  it "searches and shit" do
    get "search", {q: {terms: ["1","2","3"]}}
  end
end