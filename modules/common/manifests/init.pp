class common(
  $fsid = lookup('xyz::ceph::fsid'),
) {
  notify {"Class common is applied on ${fqdn}. fsid will be ${fsid}":}
}
