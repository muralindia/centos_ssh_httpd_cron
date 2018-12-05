# create the folder
bash "create directory" do
    code <<-EOH
    mkdir -p /opt/mysources/gitlab2
    mkdir -p /opt/mysources/gitlab3
    EOH
end


git '/opt/mysources/gitlab2' do
#  repository 'git://git.apache.org/couchdb.git'
#  repository 'git://github.com/muralindia/centos_ssh_httpd_cron.git'
## https does not work!!:(
##  repository 'https://gitlab.com/muralindia/chef_git_test.git'
 environment 'GIT_SSH_COMMAND' => 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i /root/.ssh/id_rsa'

  # repository 'git@gitlab.com:muralindia/chef_git_test.git'
  repository 'https://gitlab.com/muralindia/chef_git_test.git'
  revision 'master'
  action :sync
end

