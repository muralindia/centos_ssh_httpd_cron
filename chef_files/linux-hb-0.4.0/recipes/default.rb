#
# Cookbook:: linux-hb
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


template "/etc/cron.d/chef-client" do
        mode "644"
        owner "root"
        source 'chef-client.erb'
        action :create
end

execute "chmod of chef-client file" do
        command "crontab /etc/cron.d/chef-client"

end


#template "/var/log/chef-client.log" do
 #       mode "644"
 #       owner "root"
 #       source 'chef-client.log.erb'
 #       action :touch
#end

#service "crond" do
#       action [:restart]
#end

