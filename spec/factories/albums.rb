# == Schema Information
#
# Table name: albums
#
#  id                    :integer          not null, primary key
#  name                  :string
#  author                :string
#  description           :text
#  price                 :integer
#  availability          :boolean          default(TRUE)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :integer
#  image_file_name       :string
#  image_content_type    :string
#  image_file_size       :integer
#  image_updated_at      :datetime
#  resource_file_name    :string
#  resource_content_type :string
#  resource_file_size    :integer
#  resource_updated_at   :datetime
#  slug                  :string
#

include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :album do
    name 'MyString'
    author 'MyString'
    description 'MyText'
    price 50
    availability false
    image { fixture_file_upload(Rails.root.join('spec/fixtures/test.jpg'), 'image/jpeg') }
    resource { fixture_file_upload(Rails.root.join('spec/fixtures/test.jpg'), 'application/zip') }
  end
end
