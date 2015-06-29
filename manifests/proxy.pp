#
class jenkins::proxy {

  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  # Bring variables from Class['::jenkins'] into local scope.
  $proxy_host = $::jenkins::proxy_host
  $proxy_port = $::jenkins::proxy_port
  $no_proxy_list = $::jenkins::no_proxy_list
  $service_home = $::jenkins::service_home

  file { "${service_home}/proxy.xml":
    content => template('jenkins/proxy.xml.erb'),
    owner   => 'jenkins',
    group   => 'jenkins',
    mode    => '0644'
  }

}
