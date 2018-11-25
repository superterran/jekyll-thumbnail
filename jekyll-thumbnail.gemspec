# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
    spec.name          = "jekyll-thumbnail"
    spec.version       = "0.2.#{ENV['TRAVIS_BUILD_NUMBER']}" || "0.2"
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


    spec.metadata = {
      "bug_tracker_uri"   => "https://github.com/superterran/jekyll-thumbnail/issues",
      "changelog_uri"     => "https://example.com/user/bestgemever/CHANGELOG.md",
      "homepage_uri"      => "https://superterran.github.io/jekyll-thumbnail/",
      "source_code_uri"   => "https://github.com/superterran/jekyll-thumbnail",
      "wiki_uri"          => "https://github.com/superterran/jekyll-thumbnail/wiki"
    }
  end
  