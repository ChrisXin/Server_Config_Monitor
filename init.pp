class wm_install::block21_monitor_server_config
{
  #Execute a script to send an email of the diff for the server.sh file
  exec { 'Notify Admin server config changes':
    command =>'/home/webmethods/dist/email_server_config_changes.sh',
    cwd     => '/home/webmethods/dist',
    group   => webmethods,
    user    => webmethods,
    timeout => 15000,
    before => file['/home/ocanada.sh']
  }
  
  
  #Revert the server.sh_PROD file to its original state if changes were made
  file { '/home/ocanada.sh':
      ensure => file,
      mode   => 0755,
     
