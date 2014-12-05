# Class: glusterfs::server
#
# GlusterFS Server.
#
# Parameters:
#  $peers:
#    Array of peer IP addresses to be added. Default: empty
#
# Sample Usage :
#  class { 'glusterfs::server':
#    peers => $::hostname ? {
#      'server1' => '192.168.0.2',
#      'server2' => '192.168.0.1',
#    },
#  }
#
class glusterfs::server (
  $peers = []
) inherits glusterfs::params {

  # Main package and service it provides
  package { $package:
    ensure => installed,
    alias => 'glusterfs-server',
  }
  service { $service_name:
    enable    => true,
    ensure    => running,
    hasstatus => true,
    alias => 'glusterd',
    require   => Package['glusterfs-server'],
  }

  # Peers
  glusterfs::peer { $peers: }

}

