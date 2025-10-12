require "realogy/version"
require "realogy/railtie" if defined?(Rails)

# Configuration must be defined BEFORE models are loaded
module Realogy
  class << self
    attr_accessor :base_record_class

    def configure
      yield self
    end
  end

  # Default to ApplicationRecord
  self.base_record_class = 'ApplicationRecord'
end
