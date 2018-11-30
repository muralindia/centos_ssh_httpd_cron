We use chef cookbook with environments and attribute to ensure chef-client is periodically connecting to chef server for updates.

root@ubuntu1:/opt/chef-repo/cookbooks# knife node environment set kmnode2 qa_environment
kmnode2:
  chef_environment: _default
root@ubuntu1:/opt/chef-repo/cookbooks# knife node list -E qa_environment
kmnode2

root@ubuntu1:/opt/chef-repo/cookbooks# knife environment edit qa_environment


{
  "name": "qa_environment",
  "description": "",
  "cookbook_versions": {

  },
  "json_class": "Chef::Environment",
  "chef_type": "environment",
  "default_attributes": {
    "Cron_dynamic": {
      "cron_default": "0 */4 * * *"
    }
  },
  "override_attributes": {

  }
}

The above setting will ensure that the cron runs every 4 hours. If you need to change the timing, just edit the attribute. 
