
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "Ipng/version"

Gem::Specification.new do |spec|
  spec.name          = "Ipng"
  spec.version       = IPNG::VERSION
  spec.authors       = ["anton feldmann"]
  spec.email         = ["anton.feldmann@gmail.com"]

  spec.summary       = %q{make an intelligent png image containing a function or other different data.}
  spec.description   = %q{A png image can contain different additional information beside the image. This library puts function and/or data into the image. If you get this type of image you can execute the function or extract the data form the image. If you do not use this library to extract the data or execure the funtion it looks like an odinary png image.}
  spec.homepage      = "https://github.com/afeldman/Ipng.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://mygemserver.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'chunky_png', '~> 1.3'
  spec.add_development_dependency 'aescrypt'
end
