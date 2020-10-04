class profile::ceph_mon(
  $admin_key         = lookup('xyz::eph::admin_key'),
  $mon_key           = lookup('xyz::ceph::mon_key'),
  $bootstrap_osd_key = lookup('xyz::ceph::admin_key'),
) {

  ceph::mon { $::hostname:
    key => $mon_key,
  }

  Ceph::Key {
    inject         => true,
    inject_as_id   => 'mon.',
    inject_keyring => "/var/lib/ceph/mon/ceph-${::hostname}/keyring",
  }

  ceph::key { 'client.admin':
    secret  => $admin_key,
    cap_mon => 'allow *',
    cap_osd => 'allow *',
    cap_mds => 'allow',
  }

  ceph::key { 'client.bootstrap-osd':
    secret  => $bootstrap_osd_key,
    cap_mon => 'allow profile bootstrap-osd',
  }

}
