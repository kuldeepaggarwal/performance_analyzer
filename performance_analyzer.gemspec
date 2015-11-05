# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'performance_analyzer/version'

Gem::Specification.new do |spec|
  spec.name          = "performance_analyzer"
  spec.version       = PerformanceAnalyzer::VERSION
  spec.authors       = ["Kuldeep Aggarwal"]
  spec.email         = ["kd.engineer@yahoo.co.in"]

  spec.summary       = %q{This Gem helps to analyse memory and time execution.}
  spec.description   = %q{This Gem helps to analyse memory and time execution}
  spec.homepage      = 'https://github.com/kuldeepaggarwal/performance_analyzer'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 3.2", "< 5.0"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
