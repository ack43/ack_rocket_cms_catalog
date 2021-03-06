# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ack_rocket_cms_catalog/version'

Gem::Specification.new do |spec|
  spec.name          = "ack_rocket_cms_catalog"
  spec.version       = AckRocketCmsCatalog::VERSION
  spec.authors       = ["Alexander Kiseliev"]
  spec.email         = ["i43ack@gmail.com"]

  spec.summary       = "Items catalog with AckRocketCMS support."
  spec.description   = "Items catalog with AckRocketCMS support."
  spec.homepage      = "https://github.com/ack43/ack_rocket_cms_catalog"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency 'rails', '>= 4.1.0', '< 5.0'

  spec.add_dependency 'money-rails'
  spec.add_dependency 'mongoid_money_field'

  spec.add_dependency 'ack_rocket_cms'
end
