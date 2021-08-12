module Grape
  module Attack
    StoreError     = Class.new(StandardError)
    Exceptions     = Class.new(StandardError)
    RateLimitError = Class.new(Exceptions)
  end
end
