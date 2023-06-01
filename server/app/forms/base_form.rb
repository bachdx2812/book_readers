class BaseForm < ActiveType::Object
  MAX_INTEGER = ((1 << 32) / 2) - 1
  MAX_BIGINT = ((1 << 64) / 2) - 1
  MAX_STRING = 255
  MAX_TEXT = 65_535
  MAX_TEXT_700 = 700
  MAX_TEXT_700K = 700_000
  MAX_TEXT_11K = 11_000
  MAX_TEXT_10879 = 10_879
  MAX_TEXT_47K = 47_000
  MAX_FREE_TEXT = 16.megabytes - 1
  MAX_LENGTH_25 = 25
  MAX_TEXT_22121 = 22_121
  MAX_LENGTH_100 = 100
  MAX_QUANTITY = 31536000
  MAX_99 = 9999999999
  MIN_PORT = 25
  MAX_PORT = 65535
  MAX_URL = 2048
  MAX_CREDIT_CARD_AMOUNT = 9999999
  MAX_POSTPAID_AMOUNT = 999999
  INT_0 = 0
  INT_1 = 1
  INT_3 = 3
  INT_4 = 4
  INT_5 = 5
  INT_10 = 10
  INT_20 = 20
  INT_23 = 23
  INT_24 = 24
  INT_30 = 30
  INT_60 = 60
  INT_99 = 99
  INT_100 = 100
  INT_9000 = 9000
  RANGE_0_100 = (0..100)
  RANGE_0_99 = (0..99)
  RANGE_1_99 = (1..99)
  RANGE_1_29 = (1..29)
  RANGE_1_10 = (1..10)
  RANGE_1_7 = (1..7)
  RANGE_1_4 = (1..4)
  RANGE_1_365 = (1..365)
  RANGE_1_12 = (1..12)

  attr_accessor :model

  delegate :persisted?, to: :model, allow_nil: true

  def assign_model(model, params = {}, skip_keys = [])
    @model = model
    @params = params.with_indifferent_access.except(skip_keys)

    attributes.each do |k, _|
      next if skip_keys.include?(k.to_sym)

      self[k] = @params.key?(k) ? @params[k] : model.try(k)
    end

    self
  end

  def model_assign_attributes
    @model.assign_attributes(attributes)
  end

  def error_messages
    errors.messages.each_with_object({}) do |(k, messages), h|
      key = k.to_s.split(".").last.to_sym

      messages.each do |message|
        h[k.to_sym] = h[k.to_sym].to_a + [self.class.human_attribute_name(key) + message]
      end
    end
  end

  def error_messages_with_no_human_name
    errors.messages.each_with_object({}) do |(k, messages), h|
      messages.each do |message|
        h[k.to_sym] = h[k.to_sym].to_a + [message]
      end
    end
  end
end
