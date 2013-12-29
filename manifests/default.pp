host{'rabbitmq-a':
  ensure => present,
  ip => "192.168.57.2",
}

host{'rabbitmq-b':
  ensure => present,
  ip => "192.168.57.3",
}

class {'rabbitmq':
  service_manage => true,
  delete_guest_user => false,
# Seems not working
#  config_cluster => true,
#  cluster_nodes => [ 'rabbitmq-a', 'rabbitmq-b' ],
#  cluster_node_type => 'disc',
  wipe_db_on_cookie_change => true,
}

rabbitmq_plugin{ 'rabbitmq_federation':
  ensure => present,
}
->
rabbitmq_plugin{ 'rabbitmq_federation_management':
  ensure => present
}
