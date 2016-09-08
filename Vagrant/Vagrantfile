# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "gpcnmaster" do |gpcnmaster|
  	gpcnmaster.vm.box = "ubuntu/trusty64"
    gpcnmaster.vm.hostname = "gpcnmaster"
  	gpcnmaster.vm.network "private_network", 
      ip: "192.168.0.254", 
      virtualbox__intnet: "gpcn"
    gpcnmaster.vm.network "private_network", 
      ip: "192.168.10.254",
      virtualbox__intnet: "gpcn"
  	gpcnmaster.vm.synced_folder "./master/", "/home/vagrant/"
      
  	gpcnmaster.vm.provider "virtualbox" do |vb|
  		vb.name = "gpcnmaster"
    end

    gpcnmaster.vm.provision "shell", inline: <<-SHELL

      echo "-------------------------------- CONFIGURACAO DO MASTER --------------------------------"
      
      echo "Installing build essentials"
      sudo apt-get -y update > /dev/null
      sudo apt-get -y upgrade > /dev/null
      sudo apt-get install -y build-essential > /dev/null

    	echo "Installing SSHPASS"
    	sudo apt-get -y install sshpass > /dev/null
      echo "Status SSHPASS:"
      sshpass -V
    
    SHELL
  end

  config.vm.define "gpcnclient" do |gpcnclient|
    gpcnclient.vm.box = "ubuntu/trusty64"
    gpcnclient.vm.hostname = "gpcnclient"
    gpcnclient.vm.network "private_network", 
      ip: "192.168.0.1", 
      virtualbox__intnet: "gpcn"
    gpcnclient.vm.network "private_network", 
      ip: "192.168.10.1",
      virtualbox__intnet: "gpcn"
    gpcnclient.vm.synced_folder "./client/", "/home/vagrant/"
      
    gpcnclient.vm.provider "virtualbox" do |vb|
      vb.name = "gpcnclient"
    end

    gpcnclient.vm.provision "shell", inline: <<-SHELL

      echo "-------------------------------- CONFIGURACAO DO CLIENT --------------------------------"
      
      echo "Installing build essentials"
      sudo apt-get -y update > /dev/null
      sudo apt-get -y upgrade > /dev/null
      sudo apt-get install -y build-essential > /dev/null

      echo "Installing EthTool"
      sudo apt-get -y install ethtool > /dev/null
      echo "Status EthTool: "
      ethtool --version 

      echo "Installing TCP Dump"
      sudo apt-get -y install tcpdump > /dev/null
      echo "Status TCPDump: "
      tcpdump --version 

      echo "Installing Siege"
      sudo apt-get -y install siege > /dev/null
      echo "Status Siege: "
      siege --version 

    SHELL
  end

    config.vm.define "gpcnslave" do |gpcnslave|
    gpcnslave.vm.box = "ubuntu/trusty64"
    gpcnslave.vm.hostname = "gpcnslave"
    gpcnslave.vm.network "private_network", 
      ip: "192.168.0.7", 
      virtualbox__intnet: "gpcn"
    gpcnslave.vm.network "private_network", 
      ip: "192.168.10.7",
      virtualbox__intnet: "gpcn"
    gpcnslave.vm.synced_folder "./slave/", "/home/vagrant/"
      
    gpcnslave.vm.provider "virtualbox" do |vb|
      vb.name = "gpcnslave"
    end

    gpcnslave.vm.provision "shell", inline: <<-SHELL

      echo "-------------------------------- CONFIGURACAO DO SLAVE --------------------------------"
      
      echo "Installing build essentials"
      sudo apt-get -y update > /dev/null
      sudo apt-get -y upgrade > /dev/null
      sudo apt-get install -y build-essential > /dev/null

      echo "Installing EthTool"
      sudo apt-get -y install ethtool > /dev/null
      echo "Status EthTool: "
      ethtool --version

      echo "Installing T50"
      wget --quiet "http://downloads.sourceforge.net/project/t50/t50-5.6/t50-5.6.6.tar.gz"
      tar -xvzf t50-5.6.6.tar.gz > /dev/null
      cd t50-5.6.6
      sudo ./configure > /dev/null
      sudo make > /dev/null
      sudo make install > /dev/null
      echo "Status T50: " 
      t50 --version

    SHELL
  end

    config.vm.define "gpcnmonitorado" do |gpcnmonitorado|
    gpcnmonitorado.vm.box = "ubuntu/trusty64"
    gpcnmonitorado.vm.hostname = "gpcnmonitorado"
    gpcnmonitorado.vm.network "private_network", 
      ip: "192.168.10.201", 
      virtualbox__intnet: "gpcn"
    gpcnmonitorado.vm.synced_folder "./monitorado/", "/home/vagrant/"
      
    gpcnmonitorado.vm.provider "virtualbox" do |vb|
      vb.name = "gpcnmonitorado"
    end

    gpcnmonitorado.vm.provision "shell", inline: <<-SHELL

      echo "-------------------------------- CONFIGURACAO DO MONITORADO --------------------------------"
      
      echo "Installing build essentials"
      sudo apt-get -y update > /dev/null
      sudo apt-get -y upgrade > /dev/null
      sudo apt-get install -y build-essential > /dev/null

      echo "Installing Apache"
      sudo apt-get -y install apache2 > /dev/null
      echo "Status Apache:"
      apache2 -v

      echo "Installing Collectl"
      sudo apt-get -y install collectl > /dev/null
      echo "Status Collectl:"
      collectl --version

      echo "Installing Netstat"
      sudo apt-get -y install netstat-nat > /dev/null
      echo "Status Netstat:"
      netstat --version

      echo "Installing Sysbench"
      sudo apt-get -y install sysbench > /dev/null
      echo "Status Sysbench:"
      sysbench --version

    SHELL
  end

    config.vm.define "gpcnatacado" do |gpcnatacado|
    gpcnatacado.vm.box = "ubuntu/trusty64"
    gpcnatacado.vm.hostname = "gpcnatacado"
    gpcnatacado.vm.network "private_network", 
      ip: "192.168.0.200", 
      virtualbox__intnet: "gpcn"
    gpcnatacado.vm.synced_folder "./atacado/", "/home/vagrant/"
      
    gpcnatacado.vm.provider "virtualbox" do |vb|
      vb.name = "gpcnatacado"
    end

    gpcnatacado.vm.provision "shell", inline: <<-SHELL
      
      echo "Installing build essentials"
      sudo apt-get -y update > /dev/null
      sudo apt-get -y upgrade > /dev/null
      sudo apt-get install -y build-essential > /dev/null

      echo "-------------------------------- CONFIGURACAO DO ATACADO --------------------------------"

      echo "Installing Apache"
      sudo apt-get -y install apache2 > /dev/null
      echo "Status Apache:"
      apache2 -v

      echo "Installing Collectl"
      sudo apt-get -y install collectl > /dev/null
      echo "Status Collectl:"
      collectl --version

      echo "Installing Netstat"
      sudo apt-get -y install netstat-nat > /dev/null
      echo "Status Netstat:"
      netstat --version

      echo "Installing Stress-NG"
      sudo apt-get -y install stress-ng > /dev/null
      echo "Status Stress-ng:"
      stress-ng --version

    SHELL
  end

end