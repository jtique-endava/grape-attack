require "active_model"

module Grape
  module Attack
    class Options
      attr_accessor :limit, :per, :identifier, :remaining

      def limit
        @limit || ::Grape::Attack.config.throttle_limit
      end

      def per
        @per || ::Grape::Attack.config.throttle_interval
      end

      def identifier
        @identifier || Proc.new {}
      end

      def throttle_endpoint_individually?
        @limit && @per
      end
    end
  end
end
