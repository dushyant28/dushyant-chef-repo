
execute 'Repo update' do
  command 'apt-get update -y'
  action :run
end
