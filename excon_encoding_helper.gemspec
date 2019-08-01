# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "excon_encoding_helper/version"

Gem::Specification.new do |spec|
  spec.name          = "excon_encoding_helper"
  spec.version       = ExconEncodingHelper::VERSION
  spec.authors       = ["EDH Payments Team"]
  spec.email         = ["payments@everydayhero.com.au"]

  spec.summary       = "properly handle content-type headers in Excon responses"
  spec.description   = spec.summary

  spec.files         = `git ls-files -z 2>/dev/null`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "content-type"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "mutant-rspec"
end
