require 'rails_helper'

RSpec.describe "initiatives/show", type: :view do
  before(:each) do
    @initiative = assign(:initiative, Initiative.create!(
      :name => "Name",
      :organizer => "Organizer",
      :description => "MyText",
      :location => "Location"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Organizer/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Location/)
  end
end
