class {'hosts':
  purge_hosts  => true,
  host_entries => { 'rabbitmq-a' => { 'ip' => '192.168.57.2' },
                     'rabbitmq-b' => { 'ip' => '192.168.57.3' }
                    }
}
