require 'rails_helper'

RSpec.describe "testmdls/new", type: :view do
  before(:each) do
    assign(:testmdl, Testmdl.new(
      :tst => "MyString"
    ))
  end

  it "renders new testmdl form" do
    render

    assert_select "form[action=?][method=?]", testmdls_path, "post" do

      assert_select "input#testmdl_tst[name=?]", "testmdl[tst]"
    end
  end
end
