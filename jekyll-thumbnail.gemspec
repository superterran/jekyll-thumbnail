# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-thumbnail/version"


Gem::Specification.new do |spec|
    spec.name          = "jekyll-thumbnail"
    spec.version       = Jekyll::Thumbnail::VERSION
    spec.version       = "#{spec.version}-alpha-#{ENV['TRAVIS_BUILD_NUMBER']}" if ENV['TRAVIS'] && ENV['TRAVIS_TAG'] == 0
    spec.version       = "#{ENV['TRAVIS_TAG']}" if ENV['TRAVIS'] && ENV['TRAVIS_TAG'] != 0
    spec.authors       = ["Doug Hatcher"]
    spec.email         = ["superterran@gmail.com"]
  
    spec.summary       =    "Provides an image thumbnailer with watermark support. 
                            Adds a liquid tag `thumbnail` with a parmeter to set a resolution. 
                            Can also overlay PNGs overtop for watermarking."

    spec.homepage      = "https://superterran.github.io/jekyll-thumbnail/"
    spec.license       = "MIT"
  
    spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
    spec.require_paths = ["lib"]
  
    spec.add_dependency 'jekyll'
    spec.add_development_dependency "bundler", "~> 1.10"
    spec.add_development_dependency "rake", "~> 10.0"
  end
  