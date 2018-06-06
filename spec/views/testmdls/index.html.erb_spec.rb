require 'rails_helper'

RSpec.describe "testmdls/index", type: :view do
  before(:each) do
    assign(:testmdls, [
      Testmdl.create!(
        :tst => "Tst"
      ),
      Testmdl.create!(
        :tst => "Tst"
      )
    ])
  end

  it "renders a list of testmdls" do
    render
    assert_select "tr>td", :text => "Tst".to_s, :count => 2
  end
end
