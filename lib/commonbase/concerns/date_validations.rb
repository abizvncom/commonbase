module Commonbase
  module DateValidations
    extend ActiveSupport::Concern
  
    class_methods do
      # Validate if a date is in future. By default today is invalid. Set include_today to true to include today.
      def validate_future_date(attribute, options = {})
        validates_each attribute do |record, attr, value|
          next unless value.present?

          include_today = options[:include_today] || false

          if value < Date.today || (value == Date.today && include_today.equal?(false))
            record.errors.add(attr, options[:message] || "must be in the future")
          end
        end
      end
  
      # Validate if a date is in the past. By default today is invalid. Set include_today to true to include today.
      def validate_past_date(attribute, options = {})
        validates_each attribute do |record, attr, value|
          next unless value.present?
      
          include_today = options[:include_today] || false

          if value > Date.today || (value == Date.today && include_today.equal?(false))
            record.errors.add(attr, options[:message] || "must be in the past")
          end
        end
      end
  
      def validate_date_within_range(attribute, options = {})
        validates_each attribute do |record, attr, value|
          next unless value.present?
  
          begin_date = options[:begin].present? ? options[:begin] : nil
          end_date = options[:end].present? ? options[:end] : nil
  
          unless (value.to_date rescue nil).present?
            record.errors.add(attr, "must be a valid date")
          end
  
          unless (begin_date.to_date rescue nil).present? || (end_date.to_date rescue nil).present?
            record.errors.add(attr, "must have options with a valid date for begin or end")
          end
  
          if begin_date.present? && value < begin_date
            record.errors.add(attr, "must be after or equal to #{begin_date.strftime('%Y-%m-%d')}")
          end
  
          if end_date.present? && value > end_date
            record.errors.add(attr, "must be before or equal to #{end_date.strftime('%Y-%m-%d')}")
          end
        end
      end
    end
  end  
end
