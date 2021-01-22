Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 16384
    vb.cpus = 8
  end

  config.vm.provision "shell", inline: <<-SHELL
    cd /vagrant
    ./provision.sh
  SHELL
end
