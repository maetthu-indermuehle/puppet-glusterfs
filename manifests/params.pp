# class: glusterfs::params
#
# Default Parameters for glusterfs
#

class glusterfs::params {

  case $operatingsystem {
    /^(Ubuntu)$/: {
        $service_name = 'glusterfs-server'
        $package = ['glusterfs-server',]
    }
    default:      {
        $service_name = 'glusterd'
        $package = ['glusterfs-server',]
    }
  }
}
