module Consoles
  class SignUpForm < BaseForm
    attribute :email, :String
    attribute :password, :String
    attribute :birthday, :String
    attribute :gender, :Number

    validates :email, presence: true, format: { with: Devise.email_regexp, message: "Email khong dung" }
    validates :email, length: { maximum: 255 }
    validates :password, presence: true
    validates :password, length: { in: 6..20 }, if: -> { password.present? }

    def save
      return unless super

      @model.assign_attributes(attributes)
      @model.save
    end
  end
end
