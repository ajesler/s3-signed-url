# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 's3_signed_url/version'

Gem::Specification.new do |spec|
  spec.name          = "s3-signed-url"
  spec.version       = S3SignedUrl::VERSION
  spec.authors       = ["Andrew Esler"]
  spec.email         = ["aj@esler.co.nz"]
  spec.description   = %q{Generates a signed url and download command for S3 files}
  spec.summary       = %q{Generates a signed url and download command for S3 files}
  spec.homepage      = "https://github.com/ajesler/s3-signed-url"
  spec.license       = "MIT"

  #spec.files         = `git ls-files`.split($/)
  spec.files         = Dir.glob("{lib,bin}/**/*") + ["LICENSE.txt", "README.md"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "trollop"
  spec.add_runtime_dependency "aws-creds"
  spec.add_runtime_dependency "chronic"
end