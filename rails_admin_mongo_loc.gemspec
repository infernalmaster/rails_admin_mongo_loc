$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_mongo_loc/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_mongo_loc"
  s.version     = RailsAdminMongoLoc::VERSION
  s.authors     = ["Rostyslav Diachok"]
  s.email       = ["infernalmaster1@gmail.com"]
  s.homepage    = "https://github.com/infernalmaster/rails_admin_mongo_loc"
  s.summary     = "RailsAdmin support for mongoid localized fields."
  s.description = %q{Adds to RailsAdmin support for mongoid localized fields.}

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", '~> 4.0.0'
  s.add_dependency 'haml'
end
