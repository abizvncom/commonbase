module Commonbase
  module LogHelpers
    # ++
    # Log an exception details
    # ++
    # @param exception [Exception] Exception object
    # @param level [Symbol] Log level, default to :error
    # @param data [Hash] Additional data to log
    # --

    def log_exception(exception, level = :error, data = nil)
      unless level.present?
        level = :error
      end

      log_message(level, "Exception to_s: #{ exception.to_s }", data)
      log_message(level, "Exception message: #{ exception.message }", data)
      log_message(level, "Exception type: #{ exception.class }", data)
      log_message(level, "Exception backtrace: #{ exception.backtrace&.join("\n") }", data)
    end

    # ++
    # Log an error message
    # ++
    # @param message [String] Error message
    # @param data [Hash] Additional data to log
    # --

    def log_error(message, data = nil)
      log_message(:error, message, data)
    end

    # ++
    # Log an info message
    # ++
    # @param message [String] Information message
    # @param data [Hash] Additional data to log
    # --

    def log_info(message, data = nil)
        log_message(:info, message, data)
    end

    # ++
    # Log SMTP settings
    # ++
    # @param with_password [Boolean] Keep password in the log, default to false
    # @param level [Symbol] Log level, default to :info
    # --

    def log_smtp_settings(with_password = false, level = :info)
      smtp_settings = ActionMailer::Base.smtp_settings.dup()

      unless with_password
          smtp_settings.delete(:password)
      end

      unless level.present?
        level = :info
      end

      log_message(level, "SMTP settings: #{ smtp_settings.to_json }")
    end

    # ++
    # Log a request details
    # ++
    # @param request [ActionDispatch::Request] Request object
    # @param level [Symbol] Log level, default to :info
    # --

    def log_request(request, level = :info)
        return if request.nil?

        unless level.present?
          level = :info
        end
  
        log_message(level, "Request url:", request.url)
        log_message(level, "Request method:", request.method)
        log_message(level, "Request params:", request.params)
        log_message(level, "Request body:", request.body&.read)
    end

    def log_message(level, message, data = nil)
        return unless level.present?

        Rails.logger.public_send(level, "#{level.upcase}: #{message} #{data.inspect if data.present?}")
    end
  end
end
