class profile::ceph_common(
  $fsid              = lookup('xyz::ceph::fsid'),
) {

  class { 'ceph::repo': }

  class { 'ceph':
    fsid                => $fsid,
    mon_host            => 'deogloria.marvi.xyz,vesper.marvi.xyz,kyrie.marvi.xyz',
  }

}
