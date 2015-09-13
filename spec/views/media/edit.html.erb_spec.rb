require 'rails_helper'

RSpec.describe "media/edit", type: :view do
  before(:each) do
    @medium = assign(:medium, Medium.create!(
      :name => "MyString",
      :type => "",
      :url => "MyString",
      :description => "MyText",
      :person => ""
    ))
  end

  it "renders the edit medium form" do
    render

    assert_select "form[action=?][method=?]", medium_path(@medium), "post" do

      assert_select "input#medium_name[name=?]", "medium[name]"

      assert_select "input#medium_type[name=?]", "medium[type]"

      assert_select "input#medium_url[name=?]", "medium[url]"

      assert_select "textarea#medium_description[name=?]", "medium[description]"

      assert_select "input#medium_person[name=?]", "medium[person]"
    end
  end
end
