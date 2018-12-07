cred_data =  Chef::DataBagItem.load('gitab','password')

cred_data2 = Chef::EncryptedDataBagItem.load('bag1','credentials')

passd2 = cred_data2["cred2"]

passd = cred_data["cred"]

bash "create directory" do
  code <<-EOH
    mkdir -p /opt/mysources/gitlabA
    EOH
end

file "/opt/passwd_test" do
  content cred_data['cred']
end



git '/opt/mysources/gitlabA' do
        #repository 'https://rajagithub:Gitl1234@gitlab.com/muralindia/chef_git_test.git'
        # did not works
	#repository "https://rajagithub:cred_data['cred']@gitlab.com/muralindia/chef_git_test.git"


        repository "https://rajagithub:#{passd2}@gitlab.com/muralindia/chef_git_test.git"



        revision 'master'
        action :sync
end


