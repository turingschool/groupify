# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gschool/version'

Gem::Specification.new do |spec|
  spec.name          = "gschool"
  spec.version       = Gschool::VERSION
  spec.authors       = ["Katrina Owen"]
  spec.email         = ["katrina.owen@gmail.com"]
  spec.description   = %q{roll call}
  spec.summary       = %q{gschool student list}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.0"
end
