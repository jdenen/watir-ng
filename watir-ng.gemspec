# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'watir-ng/version'

Gem::Specification.new do |spec|
  spec.name          = "watir-ng"
  spec.version       = WatirNg::VERSION
  spec.authors       = ["Johnson Denen"]
  spec.email         = ["johnson.denen@gmail.com"]

  spec.summary       = %q{Use AngularJS ng directives as element identifiers with watir-webdriver}
  spec.description   = %q{Use AngularJS ng directives as element identifiers with watir-webdriver}
  spec.homepage      = "http://github.com/jdenen/watir-ng"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'watir', '~> 6.0.0'
  
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2.0"
  spec.add_development_dependency "cucumber", "~> 2.0.0"
end
