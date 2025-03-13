module Commonbase
  module Utils
    def self.boolean_to_yes_no(value)
      if value == true
        "YES"
      elsif value == false
        "NO"
      else
        ""
      end
    end

    def self.yes_no_to_boolean(value)
      return false unless value.present?
      return ["YES", "Y"].include?(value.upcase)
    end
      
    def self.parse_date(str, format = nil)
      return nil unless str.present?
      
      if format.present?
        return Date.strptime(str, format) rescue nil
      end

      return Date.strptime(str) rescue nil
    end
  end
end
