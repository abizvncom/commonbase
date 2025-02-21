module Commonbase
  module Utils
    def self.parse_date(str, format = nil)
      return nil unless str.present?
      return format.present? ? Date.strptime(str, format) : Date.strptime(str)
    rescue ArgumentError
      nil
    end
  end
end
