#git_key = Chef::EncryptedDataBagItem.load( "private_keys", "git_key" )
git_key = Chef::DataBagItem.load( "private_keys", "git_key" )
file "/opt/id_rsa" do
  content git_key['private']
end

gitlab_pkey6 = Chef::DataBagItem.load( "gitlab_access6", "gitlab_pkey6" )
file "/opt/id_rsa2" do
  mode '0400'
  content gitlab_pkey6['kontent1']
end
