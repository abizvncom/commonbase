module Commonbase
  module DateValidations
    extend ActiveSupport::Concern

    def validate_future_date(attribute, options = {})
      validates_each attribute do |record, attr, value|
        if value.present? && value <= Date.today
          record.errors.add(attr, options[:message] || "must be in the future")
        end
      end
    end

    def validate_past_date(attribute, options = {})
      validates_each attribute do |record, attr, value|
        if value.present? && value >= Date.today
          record.errors.add(attr, options[:message] || "must be in the past")
        end
      end
    end

    def validate_date_within_range(attribute, range, options = {})
      validates_each attribute do |record, attr, value|
        if value.present? && !range.include?(value)
          record.errors.add(attr, options[:message] || "must be within the specified range")
        end
      end
    end
  end
end
