require 'rails_helper'

RSpec.describe "media/index", type: :view do
  before(:each) do
    assign(:media, [
      Medium.create!(
        :name => "Name",
        :type => "Type",
        :url => "Url",
        :description => "MyText",
        :person => ""
      ),
      Medium.create!(
        :name => "Name",
        :type => "Type",
        :url => "Url",
        :description => "MyText",
        :person => ""
      )
    ])
  end

  it "renders a list of media" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
