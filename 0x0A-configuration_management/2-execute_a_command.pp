#!/usr/bin/env puppet
#executes a command
exec {'pkill killmenow':
  path => '/usr/bin:/usr/sbin:/bin'
}

