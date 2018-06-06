require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        :name => "Name",
        :roll_no => "Roll No"
      ),
      Student.create!(
        :name => "Name",
        :roll_no => "Roll No"
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Roll No".to_s, :count => 2
  end
end
