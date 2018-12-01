# create the folder
bash "create directory" do
    code <<-EOH
    mkdir -p /opt/mysources/couch
    EOH
end


git '/opt/mysources/couch' do
#  repository 'git://git.apache.org/couchdb.git'
  repository 'git://github.com/muralindia/centos_ssh_httpd_cron.git'
  revision 'master'
  action :sync
end
