
execute 'Updating the repo' do
  command 'yum update -y'
  action :run
end
