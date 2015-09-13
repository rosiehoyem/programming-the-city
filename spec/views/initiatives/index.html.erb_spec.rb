require 'rails_helper'

RSpec.describe "initiatives/index", type: :view do
  before(:each) do
    assign(:initiatives, [
      Initiative.create!(
        :name => "Name",
        :organizer => "Organizer",
        :description => "MyText",
        :location => "Location"
      ),
      Initiative.create!(
        :name => "Name",
        :organizer => "Organizer",
        :description => "MyText",
        :location => "Location"
      )
    ])
  end

  it "renders a list of initiatives" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Organizer".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
  end
end
