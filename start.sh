#!/bin/sh
export AWS_ACCESS_KEY=AKXXXXX55GP7WORDQ
export AWS_SECRET_ACCESS_KEY=l5XXXXXXXXXXXXXXXXXXRTvPWMHIwkp
export AWS_EC2_KEYPAIR=my-aws-keypair
export AWS_EC2_KEYPAIR_PATH=~/.ssh/my-aws-keypair.pem
export AWS_SUBNET=subnet-6xxxx852
vagrant up --provider aws
vagrant provision
