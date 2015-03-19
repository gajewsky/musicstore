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
  it do
    is_expected.to have_db_column(:created_at).of_type(:datetime)
      .with_options(null: false)
  end
  it do
    is_expected.to have_db_column(:updated_at).of_type(:datetime)
      .with_options(null: false)
  end

  it { is_expected.to have_many :sales }
  it { is_expected.to belong_to :user }

  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to validate_presence_of(:resource) }
  it { is_expected.to have_attached_file(:image) }
  it { should validate_attachment_presence(:image) }
  it do
    should validate_attachment_content_type(:image)
      .allowing('image/jpeg', 'image/png', 'image/gif')
      .rejecting('text/plain', 'text/xml')
  end
  it { is_expected.to have_attached_file(:resource) }
  it { should validate_attachment_presence(:resource) }
  it do
    should validate_attachment_content_type(:resource)
      .allowing('application/zip')
      .rejecting('text/plain', 'text/xml', 'image/jpeg')
  end
  it do
    is_expected.to validate_numericality_of(:price)
      .is_greater_than(49)
  end
end
