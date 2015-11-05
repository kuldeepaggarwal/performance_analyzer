if defined? Rails::Railtie
  module PerformanceAnalyzer
    class PerformanceAnalyzerRailtie < Rails::Railtie
      initializer "performance_analyzer.configure_rails_initialization" do |app|
        app.middleware.insert_before(::Rack::Runtime, Middleware)
      end
    end
  end
end
