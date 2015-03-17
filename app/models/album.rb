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

class Album < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image
  has_attached_file :resource
end
