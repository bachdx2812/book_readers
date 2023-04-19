# == Schema Information
#
# Table name: books
#
#  id             :bigint           not null, primary key
#  description    :text(65535)
#  lock_version   :integer          not null
#  published_date :datetime
#  title          :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Book < ApplicationRecord
end
