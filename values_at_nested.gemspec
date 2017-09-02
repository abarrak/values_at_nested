# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "date"
require "values_at_nested/version"

Gem::Specification.new do |spec|
  spec.name          = "values_at_nested"
  spec.version       = ValuesAtNested::VERSION
  spec.date          = Date.today.to_s
  spec.authors       = ["Abdullah Barrak"]
  spec.email         = ["abdullah@abarrak.com"]

  spec.summary       = "an extended version of ruby's `#values_at` hash method."
  spec.description   = "values_at_nested allows exclusion of given hash keys at various depth."
  spec.homepage      = "https://github.com/abarrak/values_at_nested"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov", "~> 0.13.0"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 1.0"
end
