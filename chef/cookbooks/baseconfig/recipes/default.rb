# Make sure the Apt package lists are up to date, so we're downloading versions that exist.
cookbook_file "apt-sources.list" do
  path "/etc/apt/sources.list"
end
execute 'apt_update' do
  command 'apt-get update'
end

# Base configuration recipe in Chef.
package "wget"
package "ntp"
#package "nginx"
#package "postgresql"
package "git"

#packages for rails
package "ruby-dev"
package "sqlite3"
package "libsqlite3-dev"
package "zlib1g-dev"
package "npm"
package "nodejs"
package "build-essential"
package "libpq-dev"

cookbook_file "ntp.conf" do
  path "/etc/ntp.conf"
end

execute 'ntp_restart' do
  command 'service ntp restart'
end

#cookbook_file "nginx-default" do
#  path "/etc/nginx/sites-available/default"
#end

#execute 'nginx_restart' do
#  command 'service nginx restart'
#end

#execute 'setup_db' do
#  command 'echo "CREATE DATABASE mydb; CREATE USER vagrant; GRANT ALL PRIVILEGES ON DATABASE mydb TO vagrant;" | sudo -u postgres psql'
#end

execute 'delete_node_files' do
  user 'vagrant'
  cwd '/home/vagrant'
  command 'sudo rm -rf project/project/node_modules'
end

execute 'move node_modules' do
  user 'vagrant'
  cwd '/home/vagrant'
  command 'sudo mkdir -p node_modules && ln -s /home/vagrant/node_modules project/project/node_modules'
end

execute 'install_yarn' do
  command 'curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list'
end

execute 'install_yarn2' do
  command 'sudo apt update && sudo apt install yarn'
end

execute 'upgrade_node' do
  user 'vagrant'
  cwd '/home/vagrant/project/project/'
  command 'sudo npm install -g n'
end

execute 'upgrade_node2' do
  user 'vagrant'
  cwd '/home/vagrant/project/project/'
  command 'sudo n 12.18.0'
end

execute 'upgrade_node3' do
  user 'vagrant'
  cwd '/home/vagrant/project/project/'
  command 'PATH="$PATH"'
end

execute 'install_bundler' do
  command 'gem install bundler --conservative'
end 

execute 'install_gems' do
  user 'vagrant'
  cwd '/home/vagrant/project/project/'
  command 'bundle install'
end

execute 'install_graphics' do
  command 'sudo apt-get install -y graphicsmagick'
end

execute 'yarn_add_webpacker' do
  user 'vagrant'
  cwd '/home/vagrant/project/project/'
  command 'sudo yarn add @rails/webpacker'
  environment 'HOME' => '/home/vagrant'
end

execute 'load_db_schema' do
  user 'vagrant'
  cwd '/home/vagrant/project/project/'
#  command 'RAILS_ENV=production rails db:schema:load'
  command 'rails db:schema:load'
  environment 'HOME' => '/home/vagrant'
end

execute 'seed_db' do
  user 'vagrant'
  cwd '/home/vagrant/project/project/'
#  command 'RAILS_ENV=production rails db:seed'
  command 'rails db:seed'
  environment 'HOME' => '/home/vagrant'
end

#execute 'precompile' do
#  user 'vagrant'
#  cwd '/home/vagrant/project/project/'
#  command 'RAILS_ENV=production sudo rails assets:precompile'
#  environment 'HOME' => '/home/vagrant'
#end

execute 'rails_run' do
  user 'vagrant'
  cwd '/home/vagrant/project/project/'
  command 'sudo rails server -d -b 0.0.0.0'
#rails s -e production
end


#Based of of class notes and 
#https://www.digitalocean.com/community/tutorials/how-to-deploy-a-rails-app-with-unicorn-and-nginx-on-ubuntu-14-04
#https://deploy-preview-3018--nostalgic-ptolemy-b01ab8.netlify.app/development/ror/use-unicorn-and-nginx-on-ubuntu-18-04/
#cookbook_file "unicorn_rails" do
#  path "/etc/init.d/unicorn_rails"
#end

#execute "unicorn_permissions" do 
#  command "sudo chmod +x /etc/init.d/unicorn_rails"
#end

#execute 'unicorn' do
#  command 'sudo update-rc.d unicorn_rails defaults'
#end

#execute 'start_unicorn' do
#  command 'sudo service unicorn_rails start'
#end

#Run to clean folder for testing:
#git clean -dfx 

#run to regenerate schema file:
#rails db:migrate RAILS_ENV=development




