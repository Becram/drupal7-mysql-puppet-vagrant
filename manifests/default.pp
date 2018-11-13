node default {
  include drupalstack::nginx
  include drupalstack::php
  include drupalstack::drupalcore
  include drupalstack::drupalapp
  include drupalstack::mysql

}

