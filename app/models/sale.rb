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

class Sale < ActiveRecord::Base
  before_create :generate_guid
  belongs_to :album

  include AASM

  aasm column: 'state' do
    state :pending, initial: true
    state :processing
    state :finished
    state :errored

    event :process, after: :charge_card do
      transitions from: :pending, to: :processing
    end
    event :finish do
      transitions from: :processing, to: :finished
    end
    event :fail do
      transitions from: :processing, to: :errored
    end
  end

  def charge_card
    save!
    charge = Stripe::Charge.create(
      amount: amount,
      currency: 'usd',
      card: stripe_token,
      description: 'Album Sale'
      )
    update(stripe_id: charge.id)
    finish!
  rescue Stripe::StripeError => e
    update(error: e.message)
    self.fail!
  end

  private

  def generate_guid
    self.guid = SecureRandom.uuid
  end
end
