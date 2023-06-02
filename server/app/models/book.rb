# == Schema Information
#
# Table name: books
#
#  id             :bigint           not null, primary key
#  author_name    :string(255)
#  description    :text(65535)
#  lock_version   :integer          not null
#  published_date :datetime
#  slug           :string(255)      not null
#  status         :integer          default("publish")
#  title          :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  idx_bs_on_slug  (slug) UNIQUE
#
class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :user_books, dependent: :destroy

  has_many_attached :images, dependent: :destroy

  enum status: {
    publish: 1,
    draft: 2,
  }
end
