class factsdotd ( $hostgroup = false ) {

    #------------
    # Directory:
    #------------

    file { ['/etc/facter','/etc/facter/facts.d']:
        ensure => directory,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',

    }

    #------------
    # hostgroup:
    #------------

    if $hostgroup == true {
        file { '/etc/facter/facts.d/hostgroup.sh':
            ensure  => present,
            content => template("${module_name}/${operatingsystem}/hostgroup.sh.erb"),
            owner   => 'root',
            group   => 'root',
            mode    => '0755',
        }
    }
}
