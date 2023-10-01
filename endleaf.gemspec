require_relative "lib/endleaf/version"

Gem::Specification.new do |spec|
  spec.name        = "endleaf"
  spec.version     = Endleaf::VERSION
  spec.authors     = ["Wittawas W"]
  spec.email       = ["start@wittawasw.com"]
  spec.homepage    = "https://github.com/wittawasw/endleaf"
  spec.summary     = "Routing and utilities for static pages creation in Rails."
  spec.description = "Routing and utilities for static pages creation in Rails."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/wittawasw/endleaf/blob/main/changelog.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 6"
end
