# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  birthday           :date
#  email              :string(255)      not null
#  encrypted_password :string(255)      not null
#  gender             :integer          default("unknown"), not null
#  lock_version       :integer          not null
#  secret_jwt_key     :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_email_and_secret_jwt_key  (email,secret_jwt_key)
#
class User < ApplicationRecord
  devise :database_authenticatable

  has_many :user_books, dependent: :destroy

  enum gender: {
    unknown: 0,
    male: 1,
    female: 2,
  }

  def jwt_payload
    generate_and_save_jwt_key

    {
      sub: id,
      secret_jwt_key: secret_jwt_key,
    }
  end

  def generate_and_save_jwt_key
    update(secret_jwt_key: SecureRandom.hex(12))
  end
end
