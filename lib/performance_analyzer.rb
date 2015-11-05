require "performance_analyzer/version"

module PerformanceAnalyzer
  autoload :Middleware, 'performance_analyzer/middleware'

  class << self
    def call
      start = Time.now
      initial_memory_usage = memory_usage
      result = yield
      stop_time = Time.now
      logger.info("\e[1;31m
Total Time Taken: #{ (Time.now - start) * 1000 }(ms)
Memory shoots from #{ initial_memory_usage } to #{ memory_usage }
        \e[0m")
      result
    end

    def logger
      @logger ||= defined?(Rails) ? Rails.logger : Logger.new(STDOUT)
    end

    def logger=(_logger)
      @logger = logger
    end

    private
      def memory_usage
        ActiveSupport::NumberHelper.number_to_human_size(`ps -o rss= -p #{Process.pid}`.to_i)
      end
  end
end

require 'performance_analyzer/performance_analyzer_railtie'
