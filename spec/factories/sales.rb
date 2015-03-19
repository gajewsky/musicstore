# == Schema Information
#
# Table name: sales
#
#  id           :integer          not null, primary key
#  buyer_email  :string
#  seller_email :string
#  amount       :integer
#  guid         :string
#  album_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  state        :string
#  stripe_id    :string
#  stripe_token :string
#  error        :text
#

FactoryGirl.define do
  factory :sale do
    buyer_email 'MyString'
    seller_email 'MyString'
    amount 50
    guid 'MyString'
    album_id 1
  end
end
