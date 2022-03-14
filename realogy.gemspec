# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'realogy/version'

Gem::Specification.new do |spec|
  spec.name          = "realogy"
  spec.version       = Realogy::VERSION
  spec.authors       = ["Michael Edlund"]
  spec.email         = ["medlund@mac.com"]

  spec.summary       = %q{Encapsulation of Realogy's DataSync API.}
  spec.description   = %q{Encapsulates the Realogy DataSync API to synchronize local data store with the data maintained by Realogy.}
  spec.homepage      = "https://github.com/arcticleo/realogy"
  spec.license       = "MIT"
  spec.required_ruby_version = '>= 2.5.3'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.3"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'sqlite3'
  spec.add_dependency "activerecord", ">= 5.0"
  spec.add_dependency "oauth2"
end
