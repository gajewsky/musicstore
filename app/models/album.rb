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

class Album < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :sales
  has_attached_file :image
  has_attached_file :resource

  validates_attachment_content_type :image,
                                    content_type: /^image\/(png|gif|jpeg)/,
                                    message: 'Only images allowed'

  validates_attachment_content_type :resource,
                                    content_type: ['application/zip'],
                                    message: 'Only zips allowed'

  validates :image, attachment_presence: true
  validates :resource, attachment_presence: true
  validates :price, numericality: { greater_than: 49 }
end
