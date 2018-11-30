We use chef cookbook with environments and attribute to ensure chef-client is periodically connecting to chef server for updates.

root@ubuntu1:/opt/chef-repo/cookbooks# knife node environment set kmnode2 qa_environment
kmnode2:
  chef_environment: _default
root@ubuntu1:/opt/chef-repo/cookbooks# knife node list -E qa_environment
kmnode2


