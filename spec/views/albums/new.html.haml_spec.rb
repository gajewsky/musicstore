require 'rails_helper'

RSpec.describe "albums/new", type: :view do
  before(:each) do
    assign(:album, Album.new(
      :name => "MyString",
      :author => "MyString",
      :description => "MyText",
      :price => 1,
      :availability => false
    ))
  end

  it "renders new album form" do
    render

    assert_select "form[action=?][method=?]", albums_path, "post" do

      assert_select "input#album_name[name=?]", "album[name]"

      assert_select "input#album_author[name=?]", "album[author]"

      assert_select "textarea#album_description[name=?]", "album[description]"

      assert_select "input#album_price[name=?]", "album[price]"

      assert_select "input#album_availability[name=?]", "album[availability]"
    end
  end
end
