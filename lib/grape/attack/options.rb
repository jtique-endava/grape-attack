require "active_model"

module Grape
  module Attack
    class Options
      include ActiveModel::Model
      include ActiveModel::Validations

      attr_accessor :limit, :per, :identifier, :remaining

      class ProcValidator < ActiveModel::EachValidator
        def validate_each(record, attribute, value)
          return true if value.nil? && options[:allow_nil]
          return true if value.is_a?(Proc) && value.call.is_a?(Numeric)

          record.errors.add attribute, "must be a Proc that resolves to a Numeric value"
        end
      end

      validates :limit, numericality: { only_integer: true, greater_than: 0 }
      validates :per, numericality: { only_integer: true, greater_than: 0 }
      validates :identifier, proc: { allow_nil: true }

      def throttle_endpoint_individually?
        @limit != ::Grape::Attack.config.throttle_limit && @per != ::Grape::Attack.config.throttle_interval
      end
    end
  end
end
