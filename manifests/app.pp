node 'node1' {

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

node default {

  notify { 'checkpoint_1' :
    message => "
    
         CHECKPOINT_1
         DEFAULT BLOCK APPLIED
         Looks like there is no node defination for this host
    "
  }
}


node 'node2' {

  include base
  class {'::tomcat' :
    xms           => '70m',
    xmx           => '210m',
    user          => 'tomcat',
    group         => 'tomcat',
    service_state => 'running',
  }
  
  tomcat::deploy { "sysfoo":
    deploy_url     => 'https://2-115020838-gh.circle-artifacts.com/0/tmp/circle-artifacts.rWYWrdH/sysfoo.war',
    checksum_value => "28fc064d7acb8742e3eccd25bab78f81",
  }
  
}