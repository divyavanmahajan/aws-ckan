SET AWS_ACCESS_KEY=AKXXXXX55GP7WORDQ
SET AWS_SECRET_ACCESS_KEY=l5XXXXXXXXXXXXXXXXXXRTvPWMHIwkp
SET AWS_EC2_KEYPAIR=my-aws-keypair
SET AWS_EC2_KEYPAIR_PATH=~/.ssh/my-aws-keypair.pem
SET AWS_SUBNET=subnet-6xxxx852
vagrant up --provider aws
vagrant provision
