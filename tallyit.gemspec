# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tallyit/version'

Gem::Specification.new do |spec|
  spec.name          = "tallyit"
  spec.version       = Tallyit::VERSION
  spec.authors       = ["hzlu"]
  spec.email         = ["hzlu2010@gmail.com"]

  spec.summary       = %q{take notes about your balance}
  spec.description   = %q{take a daily tally use command line}
  spec.homepage      = "https://github.com/hzlu/tallyit"

  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "terminal-table", "~> 1.5"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
