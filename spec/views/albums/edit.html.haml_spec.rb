require 'rails_helper'

RSpec.describe "albums/edit", type: :view do
  before(:each) do
    @album = assign(:album, Album.create!(
      :name => "MyString",
      :author => "MyString",
      :description => "MyText",
      :price => 1,
      :availability => false
    ))
  end

  it "renders the edit album form" do
    render

    assert_select "form[action=?][method=?]", album_path(@album), "post" do

      assert_select "input#album_name[name=?]", "album[name]"

      assert_select "input#album_author[name=?]", "album[author]"

      assert_select "textarea#album_description[name=?]", "album[description]"

      assert_select "input#album_price[name=?]", "album[price]"

      assert_select "input#album_availability[name=?]", "album[availability]"
    end
  end
end
