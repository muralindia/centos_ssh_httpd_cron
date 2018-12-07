chef_gem "chef-vault"
require 'chef-vault'

cred_data =  Chef::DataBagItem.load('gitab','password')

cred_data2 = Chef::EncryptedDataBagItem.load('bag1','credentials')

passd2 = cred_data2["cred2"]

passd = cred_data["cred"]

item1 = ChefVault::Item.load("secret3","gitlabp")
itemp1 = item1["passw"]

bash "create directory" do
  code <<-EOH
    mkdir -p /opt/mysources/gitlabA
    mkdir -p /opt/mysources/gitlabC
    cd /opt/mysources/gitlabC
    git clone -b master "https://rajagithub:#{itemp1}@gitlab.com/muralindia/chef_git_test.git"
    EOH
end

file "/opt/passwd_testv" do
   sensitive true
  content "#{itemp1}"
end



git '/opt/mysources/gitlabA' do
	sensitive true
        #repository 'https://rajagithub:Gitl1234@gitlab.com/muralindia/chef_git_test.git'
        # did not works
	#repository "https://rajagithub:cred_data['cred']@gitlab.com/muralindia/chef_git_test.git"


        #repository "https://rajagithub:#{passd2}@gitlab.com/muralindia/chef_git_test.git"
        repository "https://rajagithub:#{itemp1}@gitlab.com/muralindia/chef_git_test.git" 



        revision 'master'
        action :sync
end

#execute "git command" do
 #  sensitive true
  # command "cd /opt/mysources/gitlabC"
   #command "git clone -branch master https://rajagithub:#{itemp1}@gitlab.com/muralindia/chef_git_test.git"
   #command "git clone https://rajagithub:#{itemp1}@gitlab.com/muralindia/chef_git_test.git --branch master"
#end
