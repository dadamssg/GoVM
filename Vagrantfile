github_username = "user"

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/trusty64"

  # Set the server timezone
    config.vm.provision "shell",
        inline: "echo setting timezone to UTC; ln -sf /usr/share/zoneinfo/UTC /etc/localtime"

    config.vm.hostname = "go.dev"
    config.vm.network :private_network, ip: "192.168.56.189"
    config.ssh.forward_agent = true

    config.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 512]
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

  config.vm.synced_folder ".", "/vagrant",
            id: "core",
            :nfs => true,
            :mount_options => ['nolock,vers=3,udp,noatime']

    config.vm.provision "shell", path: "scripts/base.sh"

    config.vm.provision "shell", path: "scripts/go.sh",args: github_username

end