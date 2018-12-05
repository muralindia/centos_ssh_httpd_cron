['bacon', 'eggs', 'sausage'].each do |type|
file "/tmp/#{type}" do
content "#{type} is delicious!"
end
end

#node.default["eatable"]["items"] = ['bacon1', 'eggs1', 'sausage1']
node["eatable"]["items"].each do |i|
file "/tmp/#{i}" do
content "#{i} is super tasty!"
end
end

node["eatable"]["items"].each do |i|
    bash "echodisplay" do
    code <<-EOH
    echo "#{i}" "hello"
    EOH
end
end
