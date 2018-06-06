require 'rails_helper'

RSpec.describe "Testmdls", type: :request do
  describe "GET /testmdls" do
    it "works! (now write some real specs)" do
      get testmdls_path
      expect(response).to have_http_status(200)
    end
  end
end
