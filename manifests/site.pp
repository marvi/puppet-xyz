node /es01.local/ {
  class { 'common': }
  class { 'profile::es_data':
  }
}

node /es02.local/ {
  class { 'common': }
  class { 'profile::es_master': }
}

node /kibana01.local/ {
  class { 'common': }
  class { 'kibana':
    manage_repo => false,
    ensure      => '7.7.0',
    status      => 'enabled',
    config      => {
      'server.host'         => '0.0.0.0',
      'elasticsearch.hosts' => ['http://es01.local:9200',
                                'http://es02.local:9200'],
    },
  }
}

#config      => {
#  'cluster'name' => 'Gurka',
#  'node'         => {
#    'master' => true,
#    'data'   => true,
#},
#'network' => {
#  'bind_host'    => '0.0.0.0',
#  'publish_host' => 'es01.local',
#},
#'discovery.seed_hosts' => ['es01.local','es02.local']
#}
#}
