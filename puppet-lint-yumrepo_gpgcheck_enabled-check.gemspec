Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-yumrepo_gpgcheck_enabled-check'
  spec.version     = '0.0.2'
  spec.homepage    = 'https://github.com/deanwilson/puppet-lint-yumrepo_gpgcheck_enabled-check'
  spec.license     = 'MIT'
  spec.author      = 'Dean Wilson'
  spec.email       = 'dean.wilson@gmail.com'
  spec.files       = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*',
    'spec/**/*',
  ]
  spec.test_files  = Dir['spec/**/*']
  spec.summary     = 'puppet-lint check to ensure gpgcheck is enabled on yumrepo resources'
  spec.description = <<-DESCRIPTION
    A puppet-lint extension that ensures yumrepo resources have the gpgcheck
    attribute and that it is enabled.
  DESCRIPTION

  spec.add_dependency             'puppet-lint', '>= 1.1', '< 3.0'

  spec.add_development_dependency 'rake', '~> 13.0.0'
  spec.add_development_dependency 'rspec', '~> 3.9.0'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.0'
  spec.add_development_dependency 'rspec-its', '~> 1.0'
  spec.add_development_dependency 'rspec-json_expectations', '~> 2.2'
  spec.add_development_dependency 'rubocop', '~> 0.89.0'
  spec.add_development_dependency 'simplecov', '~> 0.18.0'
end
