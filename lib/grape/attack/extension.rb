module Grape
  module Attack
    module Extension
      def throttle
        route_setting(:throttle, {
          limit: ::Grape::Attack.config.throttle_limit,
          per:   ::Grape::Attack.config.throttle_interval
        })
      end

      # Grape::API::Instance is defined in Grape >= 1.2.0
      grape_api = defined?(::Grape::API::Instance) ? ::Grape::API::Instance : ::Grape::API
      grape_api.extend self
    end
  end
end
