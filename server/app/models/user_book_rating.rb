# == Schema Information
#
# Table name: user_book_ratings
#
#  id         :bigint           not null, primary key
#  point      :integer          default(1), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_user_book_ratings_on_user_id_and_book_id  (user_id,book_id) UNIQUE
#
class UserBookRating < ApplicationRecord
  belongs_to :user
  belongs_to :book

  VALID_RATE_POINTS = (1..5).to_a.freeze
end
