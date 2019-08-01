# Classe Principal
#
class devops (

  String $developer_name = '-',
  String $developer_lastname = '-',
  String $email = '-',
  String $project_url = 'https://github.com/vanessafso/devops.git',
  String $versao = '0.1.0',
  String $branch = 'master',
  String $url_apache = '-',
  String $apache_path = '/var/www/devops',
  String $username = '-',
  String $empresa = '-',
  String $equipe = '-',

){

  file { 'template.conf':
    ensure  => file,
    path    => '/opt/template.conf',
    mode    => '0755',
    content => template('devops/template.conf.erb'),
  }

  file { 'index.html':
    ensure  => file,
    path    => "${apache_path}/index.html",
    mode    => '0755',
    content => template('devops/index.html.erb'),
  }

  file { 'images':
    ensure  => present,
    path    => "${apache_path}/images",
    mode    => '0755',
    source  => 'puppet:///modules/devops/images',
    recurse => true,
  }

  file { 'teste':
    ensure  => present,
    path    => "${apache_path}/teste",
    mode    => '0755',
    source  => 'puppet:///modules/devops/teste',
    recurse => true,
  }

}
