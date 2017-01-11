# Install chef-dk for Ubuntu
is_ubuntu && curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -c current -P chefdk

# Install chef gems
if [[ "$(type -P chef)" ]]; then
  chef gem install knife-ec2
  chef gem install knife-solo
fi