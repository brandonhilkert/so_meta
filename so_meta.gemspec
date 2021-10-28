# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'so_meta/version'

Gem::Specification.new do |spec|
  spec.name          = "so_meta"
  spec.version       = SoMeta::VERSION
  spec.authors       = ["Brandon Hilkert"]
  spec.email         = ["brandonhilkert@gmail.com"]
  spec.description   = %q{A gem to simply manage meta content (title, description, canonical url, etc.) from within a Rails application.}
  spec.summary       = %q{A gem to simply manage meta content (title, description, canonical url, etc.) from within a Rails application.}
  spec.homepage      = "https://github.com/brandonhilkert/so_meta"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
