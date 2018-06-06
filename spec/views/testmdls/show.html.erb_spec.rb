require 'rails_helper'

RSpec.describe "testmdls/show", type: :view do
  before(:each) do
    @testmdl = assign(:testmdl, Testmdl.create!(
      :tst => "Tst"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Tst/)
  end
end
