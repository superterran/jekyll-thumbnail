Gem::Specification.new do |spec|
    spec.name          = "jekyll-thumbnail"
    spec.version       = "0.1.1"
    spec.authors       = ["Doug Hatcher"]
    spec.email         = ["superterran@gmail.com"]
  
    spec.summary       =    "Provides an image thumbnailer with watermark support. 
                            Adds a liquid tag `thumbnail` with a parmeter to set a resolution. 
                            Can also overlay PNGs overtop for watermarking."

    spec.homepage      = "https://superterran.github.io/jekyll-thumbnail/"
    spec.license       = "MIT"
  
    spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(LICENSE|README|lib)!i) }
  
    spec.add_development_dependency "bundler", "~> 1.16"
    spec.add_development_dependency "rake", "~> 12.0"
  end
  