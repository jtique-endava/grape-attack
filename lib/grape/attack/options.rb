require "active_model"

module Grape
  module Attack
    class Options
      include ActiveModel::Model
      include ActiveModel::Validations

      attr_accessor :limit, :per, :identifier, :remaining

      validates :limit, numericality: { allow_nil: true, only_integer: true, greater_than: 0 }
      validates :per, numericality: { allow_nil: true, only_integer: true, greater_than: 0 }

      def throttle_endpoint_individually?
        @limit.present? && @per.present?
      end
    end
  end
end
