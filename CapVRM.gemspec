# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'CapVRM/version'

Gem::Specification.new do |spec|
  spec.name          = "CapVRM"
  spec.version       = CapVRM::VERSION
  spec.authors       = ["Francis Fish"]
  spec.email         = ["francis.fish@findsyou.com"]
  spec.summary       = %q{VRM lookup from CAP https://cap.co.uk}
  spec.description   = %q{Usage etc. is in the github repo}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "active_support"
end
