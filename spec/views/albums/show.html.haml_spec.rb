require 'rails_helper'

RSpec.describe 'albums/show', type: :view do
  before(:each) do
    @album = assign(:album, Album.create!(
                              name: 'Name',
                              author: 'Author',
                              description: 'MyText',
                              price: 1,
                              availability: false
    ))
  end

  # it "renders attributes in <p>" do
  #   render
  #   expect(rendered).to match(/Name/)
  #   expect(rendered).to match(/Author/)
  #   expect(rendered).to match(/MyText/)
  #   expect(rendered).to match(/1/)
  #   expect(rendered).to match(/false/)
  # end
end
