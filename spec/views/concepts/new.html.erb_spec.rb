require 'rails_helper'

RSpec.describe "concepts/new", type: :view do
  before(:each) do
    assign(:concept, Concept.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new concept form" do
    render

    assert_select "form[action=?][method=?]", concepts_path, "post" do

      assert_select "input#concept_name[name=?]", "concept[name]"

      assert_select "textarea#concept_description[name=?]", "concept[description]"
    end
  end
end
