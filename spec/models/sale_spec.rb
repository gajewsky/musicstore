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

require 'rails_helper'

RSpec.describe Sale, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:sale)).to be_valid
  end

  it { is_expected.to have_db_column(:id).of_type(:integer) }
  it { is_expected.to have_db_column(:buyer_email).of_type(:string) }
  it { is_expected.to have_db_column(:seller_email).of_type(:string) }
  it { is_expected.to have_db_column(:amount).of_type(:integer) }
  it { is_expected.to have_db_column(:guid).of_type(:string) }
  it { is_expected.to have_db_column(:album_id).of_type(:integer) }
  it { is_expected.to have_db_column(:state).of_type(:string) }
  it { is_expected.to have_db_column(:stripe_id).of_type(:string) }
  it { is_expected.to have_db_column(:stripe_token).of_type(:string) }
  it { is_expected.to have_db_column(:error).of_type(:text) }
  it do
    is_expected.to have_db_column(:created_at).of_type(:datetime)
      .with_options(null: false)
  end
  it do
    is_expected.to have_db_column(:updated_at).of_type(:datetime)
      .with_options(null: false)
  end

  it { is_expected.to belong_to :album}

   describe '#generate_guid' do
    subject { create(:sale) }
    it 'should create new token ' do
      expect { Token.generate }.to change(Token, :count)
    end
    it 'should return Token object' do
      expect(subject).to be_a(Token)
    end

    it 'should assign generated token 24 char string to value column' do
      expect(subject.value.length).to eq(24)
    end
  end


end
