# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "chef/ubuntu-16.04"
  config.vm.network :private_network, ip: "192.168.33.10"

  config.vm.provider :aws do |aws, override|
    override.vm.box = "dummy"
    override.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

    override.ssh.private_key_path = ENV['AWS_EC2_KEYPAIR_PATH']
    aws.access_key_id     = ENV['AWS_ACCESS_KEY']
    aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
    aws.keypair_name      = ENV['AWS_EC2_KEYPAIR']
    aws.subnet_id = ENV['AWS_SUBNET']
    aws.region = "us-east-1"
    aws.ami = "ami-840910ee" # Ubuntu 16.04 hvm:ebs-ssd

# http://cloud-images.ubuntu.com/locator/ec2/
    # The following need the 0.8.0 vagrant-aws plugin which is not released.
    #aws.aws_profile = ENV['AWS_DEFAULT_PROFILE']
    #aws.region_config "us-east-1", :ami => "ami-12345678"
    #aws.region_config "us-west-2", :ami => "ami-fa82739a"
    #aws.region_config "us-west-1", :ami => "ami-d8e996b8"
    #aws.region_config "eu-west-1", :ami => "ami-3079f543"
    #aws.region_config "eu-central-1", :ami => "ami-f0eb089f"

    aws.tags = { 
	'Name' => 'CKAN-xlarge'
    }

    aws.instance_type = "m4.xlarge"

    #aws.block_device_mapping = [{ 'DeviceName' => '/dev/sda1', 'Ebs.VolumeSize' => 50 }]
    #aws.user_data = File.read("user_data.txt")
    override.ssh.username = "ubuntu"
  end

  config.ssh.pty = true
  #config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision :shell, :path => "aws_cloudinit.sh"
end
