# == Schema Information
#
# Table name: albums
#
#  id           :integer          not null, primary key
#  name         :string
#  author       :string
#  description  :text
#  price        :integer
#  availability :boolean          default(TRUE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#

FactoryGirl.define do
  factory :album do
    name 'MyString'
    author 'MyString'
    description 'MyText'
    price 1
    availability false
  end
end
