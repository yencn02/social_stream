require 'faraday'
module Faraday
  class Adapter < Middleware
    def call(env)
      env[:ssl][:verify] = false if env[:ssl]
    end
  end
end
