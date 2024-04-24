#!/usr/bin/pup
#install flask from pip3
package {'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

# Check if Flask is installed correctly
exec { 'check_flask_version':
  command   => 'flask --version | grep "Flask 2.1.0"',
  path      => '/usr/local/bin:/usr/bin:/bin',
  logoutput => true,
  subscribe => Package['Flask'],
  refreshonly => true,
}

#prints success message
exec { 'print_success_message':
  command     => 'echo "Your Puppet manifest configures the host according to requirements"',
  path        => '/usr/local/bin:/usr/bin:/bin',
  logoutput   => true,
  subscribe   => Exec['check_flask_version'],
  refreshonly => true,
}
