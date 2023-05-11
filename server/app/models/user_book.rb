# == Schema Information
#
# Table name: user_books
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#  user_id    :bigint           not null
#
class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
end
