# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/thumbor_tag/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-thumbor"
  spec.version       = Jekyll::ThumborTag::VERSION
  spec.summary       = %q{A Jekyll template tag for Thumbor imaging service.}
  spec.description   = %q{A Jekyll template tag for Thumbor imaging service.}
  spec.license       = "MIT"

  spec.authors       = ["Myles Braithwaite"]
  spec.email         = ["me@mylesbraithwaite.com"]

  spec.homepage      = "http://myles.github.io/jekyll-thumbor/"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "ruby-thumbor"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "jekyll"
end
