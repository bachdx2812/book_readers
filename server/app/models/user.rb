# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  birthday           :date
#  email              :string(255)      not null
#  encrypted_password :string(255)      not null
#  lock_version       :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  sex_id             :integer
#
class User < ApplicationRecord
  devise :database_authenticatable
end
