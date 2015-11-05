module PerformanceAnalyzer
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      PerformanceAnalyzer.call { @app.call(env) }
    end
  end
end
