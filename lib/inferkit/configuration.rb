module Inferkit
  class << self
    attr_reader :configuration

    def configure(api_key: nil)
      @configuration =
        Inferkit::Configuration.new(api_key || ENV['INFERKIT_API_KEY'])
    end
  end

  class Configuration
    attr_accessor :api_key

    def initialize(api_key)
      @api_key = api_key
    end
  end
end
