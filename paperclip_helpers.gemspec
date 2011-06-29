# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "paperclip_helpers"
  s.summary = "Initializers and helper methods for using Paperclip."
  s.description = "Initializers and helper methods for using Paperclip."
  
  s.files = Dir["{app,lib,config,public}/**/*"] +
            ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  
  s.version = "0.1"
  
  s.add_dependency 'rails', '3.1.0rc4'
  s.add_dependency 'paperclip'
  
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'sqlite3'
end