require_relative "lib/commonbase/version"

Gem::Specification.new do |spec|
  spec.name        = "commonbase"
  spec.version     = Commonbase::VERSION
  spec.authors     = [ "Juan" ]
  spec.email       = [ "juanonsoftware@gmail.com" ]
  spec.homepage    = "https://abizvn.com"
  spec.summary     = "Commonbase module."
  spec.description = "Commonbase module for other modules."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/abizvncom/commonbase"
  spec.metadata["changelog_uri"] = "https://github.com/abizvncom/commonbase"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", "~> 7.2"
end
