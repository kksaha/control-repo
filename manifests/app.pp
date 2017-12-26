node 'node3' {

  include base
  class {'::tomcat' :
    xms           => '32m',
    xmx           => '256m',
    user          => 'tomcat',
    group         => 'tomcat',
    service_state => "running",
  }
  
  tomcat::deploy { "sysfoo":
    deploy_url     => 'https://1-115020838-gh.circle-artifacts.com/0/tmp/circle-artifacts.jt3lcRx/sysfoo.war',
    checksum_value => "28e321058f5e2a6081905b823786be41",
  }
  
}


