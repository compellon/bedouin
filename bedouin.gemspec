# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bedouin/version'

Gem::Specification.new do |spec|
  spec.name          = "bedouin"
  spec.version       = Bedouin::VERSION
  spec.authors       = ["David Bresson"]
  spec.email         = ["dbresson@compellon.com"]

  spec.summary       = %q{Bedouin provides a templating system for Hashicorp Nomad.}
  spec.homepage      = "https://github.com/compellon/bedouin"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|docker)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "erubis", "~> 2.7"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
