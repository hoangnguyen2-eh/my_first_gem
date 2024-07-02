require 'spec_helper'
RSpec.describe MyFirstGem do
  it "has a version number" do
    expect(MyFirstGem::VERSION).not_to be nil
  end
end
RSpec.describe MyFirstGem do
  describe "Call external api test" do
    let(:url) { "https://api.example.com" }

    it "makes a successful API request" do
      stub_request(:get, "https://api.example.com").to_return(body: "API response", status: 200)
      expect(MyFirstGem.call_external_api(url)).to eq("API response")
    end

    it "raises an error for failed API request" do
      stub_request(:get, "https://api.example.com").to_return(body: "API response", status: 400)
      expect { MyFirstGem.call_external_api(url) }.to raise_error(StandardError, "API request failed")
    end
  end
end