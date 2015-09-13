require 'rails_helper'

RSpec.describe "initiatives/edit", type: :view do
  before(:each) do
    @initiative = assign(:initiative, Initiative.create!(
      :name => "MyString",
      :organizer => "MyString",
      :description => "MyText",
      :location => "MyString"
    ))
  end

  it "renders the edit initiative form" do
    render

    assert_select "form[action=?][method=?]", initiative_path(@initiative), "post" do

      assert_select "input#initiative_name[name=?]", "initiative[name]"

      assert_select "input#initiative_organizer[name=?]", "initiative[organizer]"

      assert_select "textarea#initiative_description[name=?]", "initiative[description]"

      assert_select "input#initiative_location[name=?]", "initiative[location]"
    end
  end
end
