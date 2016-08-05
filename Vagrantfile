Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.synced_folder ".", "/var/www/express-mysql-starter"
    config.vm.network :private_network, ip: "192.168.10.11"
    config.vm.provision "shell", path: "infra/init.sh", privileged: false
end
