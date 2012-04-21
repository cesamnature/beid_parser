$:.push File.expand_path("../lib", __FILE__)
# Maintain your gem's version:
require "beid_parser/version"

Gem::Specification.new do |s|
   s.name = "beid_parser"
   s.summary = "Ruby beID parser. Allowing to easily handle beID xml files"
   s.description = "Ruby beID parser. Allowing to easily handle beID xml files"
   s.version = BeidParser::VERSION
   s.authors = "Thibault Poncelet"
   s.email = "thibaultponcelet@gmail.com"
   s.platform = Gem::Platform::RUBY
   s.required_ruby_version = '>=1.9.2'
   s.files = Dir["{lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
   s.has_rdoc = true
   s.test_files  = Dir.glob("spec/**/*.rb")
   s.homepage    = "https://github.com/thibaultponcelet/beid_parser"
   s.add_development_dependency 'rspec', '~> 2.5'
end
