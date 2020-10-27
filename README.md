# puppet-lint yumrepo_gpgcheck_enabled check

A puppet-lint extension that ensures yumrepo resources have the gpgcheck
attribute and that it is enabled.

[![Actions Status](https://github.com/deanwilson/puppet-lint-yumrepo_gpgcheck_enabled-check/workflows/Ruby/badge.svg)](https://github.com/deanwilson/puppet-lint-yumrepo_gpgcheck_enabled-check/actions)

The `gpgcheck` attribute indicates if `yum` should perform a GPG
signature check on packages. Having this disabled means you'll accept
any packages from your configured repo, not just those signed by the
packagers. While it's often more work to sign your own packages you should
at the very least enable it for all upstream yum repositories.

## Installation

To use this plugin add the following line to your Gemfile

    gem 'puppet-lint-yumrepo_gpgcheck_enabled-check'

and then run `bundle install`

## Usage

This plugin provides a new check to `puppet-lint` that warns if it finds
a `yumrepo` resource that either does not contain the `gpgcheck` attribute
or does not set the value to enable it.

    yumrepo { 'company_app_repo':
      enabled  => 1,
      descr    => 'Local repo holding company application packages',
      baseurl  => 'http://repos.example.org/apps',
    }

This example is missing `gpgcheck` and will return

    yumrepo should have the gpgcheck attribute

The second example does not enable `gpgcheck`

    yumrepo { 'company_app_repo':
      enabled  => 1,
      descr    => 'Local repo holding company application packages',
      baseurl  => 'http://repos.example.org/apps',
      gpgcheck => 0,
    }

and will return

    yumrepo should enable the gpgcheck attribute

## Other puppet-lint plugins

You can find a list of my `puppet-lint` plugins in the
[unixdaemon puppet-lint-plugins](https://github.com/deanwilson/unixdaemon-puppet-lint-plugins) repo

### Author
[Dean Wilson](http://www.unixdaemon.net)
