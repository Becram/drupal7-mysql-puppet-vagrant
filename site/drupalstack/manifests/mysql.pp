class drupalstack::mysql {

   $override_options = {
    'mysqld' => {
         'bind-address' => '127.0.0.1',
     }  
  }

  class { '::mysql::server':
  root_password           => 'strongpassword',
  remove_default_accounts => true,
  override_options        => $override_options
 }
  

  mysql::db { 'mydb':
  user     => 'myuser',
  password => 'mypass',
  host     => 'localhost',
  grant    => ['SELECT','INSERT','DELETE','DROP','UPDATE', 'CREATE']
}


}
