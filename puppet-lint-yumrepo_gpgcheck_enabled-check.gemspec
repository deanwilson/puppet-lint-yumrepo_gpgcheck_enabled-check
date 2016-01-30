Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-yumrepo_gpgcheck_enabled-check'
  spec.version     = '0.0.1'
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
  spec.description = <<-EOF
    A puppet-lint extension that ensures yumrepo resources have the gpgcheck
    attribute and that it is enabled.
  EOF

  spec.add_dependency             'puppet-lint', '~> 1.1'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its', '~> 1.0'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.0'
  spec.add_development_dependency 'rubocop', '~> 0.36.0'
  spec.add_development_dependency 'rake'
end