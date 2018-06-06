require 'rails_helper'

RSpec.describe "testmdls/edit", type: :view do
  before(:each) do
    @testmdl = assign(:testmdl, Testmdl.create!(
      :tst => "MyString"
    ))
  end

  it "renders the edit testmdl form" do
    render

    assert_select "form[action=?][method=?]", testmdl_path(@testmdl), "post" do

      assert_select "input#testmdl_tst[name=?]", "testmdl[tst]"
    end
  end
end
