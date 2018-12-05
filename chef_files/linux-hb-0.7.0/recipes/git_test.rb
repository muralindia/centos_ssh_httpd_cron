# create the folder
bash "create directory" do
    code <<-EOH
    mkdir -p /opt/mysources/gitlab
    EOH
end


git '/opt/mysources/gitlab' do
#  repository 'git://git.apache.org/couchdb.git'
#  repository 'git://github.com/muralindia/centos_ssh_httpd_cron.git'
  repository 'https://gitlab.com/muralindia/chef_git_test.git'
  revision 'master'
  action :sync
end
