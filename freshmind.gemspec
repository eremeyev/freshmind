# frozen_string_literal: true

require_relative 'lib/freshmind/version'

Gem::Specification.new do |spec|
  spec.name        = 'freshmind'
  spec.version     = Freshmind::VERSION
  spec.required_ruby_version = '>= 2.6.2'
  spec.authors     = ['Andrey Eremeev']
  spec.email       = ['andrey.eremeyev@gmail.com']
  spec.homepage    = 'https://github.com/eremeyev/freshmind'
  spec.summary     = 'Simple exercises to refresh your mind'
  spec.description = 'Simple exercises to refresh your mind'
  spec.license     = 'MIT'
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://rubygems.org'
  spec.metadata['changelog_uri'] = 'https://rubygems.org'
  spec.files = Dir['{app,config,db,lib}/**/*',
                   'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.executables << 'freshmind'
end
