class {'hosts':
  purge_hosts  => true,
  host_entries => { 'rabbitmq-a' => { 'ip' => '192.168.57.2' },
                     'rabbitmq-b' => { 'ip' => '192.168.57.3' }
                    }
}

class {'rabbitmq':
  service_manage => true,
  delete_guest_user => false,
  config_cluster => true,
  cluster_nodes => [ 'rabbitmq-a', 'rabbitmq-b' ],
  cluster_node_type => 'disk',
}
