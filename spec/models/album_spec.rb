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

require 'rails_helper'

RSpec.describe Album, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:album)).to be_valid
  end
  
  it { is_expected.to have_db_column(:id).of_type(:integer) }
  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_column(:author).of_type(:string) }
  it { is_expected.to have_db_column(:description).of_type(:text) }
  it { is_expected.to have_db_column(:price).of_type(:integer) }
  it { is_expected.to have_db_column(:availability).of_type(:boolean) }

  it { is_expected.to have_many :sales }
  it { is_expected.to belong_to :user }

  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to validate_presence_of(:resource) }
end
