$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_phone/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_phone"
  s.version     = RailsPhone::VERSION
  s.authors     = ["Stephen Pike"]
  s.email       = ["spike@scpike.net"]
  s.homepage    = "http://github.com/scpike/rails_phone"
  s.summary     = "Simple phone number support in rails models."
  s.description = "Handling for phone numbers in rails apps. Make the aggressive
assumption that a valid phone number is a 10 digit number. Users can
input numbers in any format so long as they contain exactly 10 numeric
digits."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"

  s.add_development_dependency "sqlite3"
end
