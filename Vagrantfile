Vagrant.configure(2) do |config|
    config.vm.box = 'centos/7'
    config.vm.box_url = 'centos/7'
    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
    end
 	config.vm.define "samplebox" do |samplebox|
   	 	samplebox.vm.hostname = 'samplebox'
    	samplebox.vm.network "public_network", use_dhcp_assigned_default_route: true
    	samplebox.vm.synced_folder ".", "/srv/salt", id: "salt"
    	samplebox.vm.post_up_message = "Install completed for vm samplebox!"
  	end
end

