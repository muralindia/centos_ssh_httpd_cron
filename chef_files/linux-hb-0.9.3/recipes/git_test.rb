# create the folder
bash "create directory" do
    code <<-EOH
    mkdir -p /opt/mysources/github
    EOH
end


git '/opt/mysources/github' do
#  repository 'git://git.apache.org/couchdb.git'
#  repository 'git://github.com/muralindia/centos_ssh_httpd_cron.git'
#  repository 'https://gitlab.com/muralindia/chef_git_test.git'

  repository 'https://github.com/muralindia/centos_ssh_httpd_cron.git'
  revision 'release'
  action :sync
end
