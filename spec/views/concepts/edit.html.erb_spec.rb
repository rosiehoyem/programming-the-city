require 'rails_helper'

RSpec.describe "concepts/edit", type: :view do
  before(:each) do
    @concept = assign(:concept, Concept.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit concept form" do
    render

    assert_select "form[action=?][method=?]", concept_path(@concept), "post" do

      assert_select "input#concept_name[name=?]", "concept[name]"

      assert_select "textarea#concept_description[name=?]", "concept[description]"
    end
  end
end
