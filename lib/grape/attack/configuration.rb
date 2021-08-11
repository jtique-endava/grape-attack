module Grape
  module Attack
    class Configuration
      attr_accessor :adapter, :disable, :throttle_limit, :throttle_interval

      def initialize
        @adapter           = ::Grape::Attack::Adapters::Redis.new
        @disable           = Proc.new { false }
        @throttle_limit    = 600
        @throttle_interval = 1.hour
      end
    end
  end
end
