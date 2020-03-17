#!/bin/bash
name=$(eval "terraform output name");
vpc=$(eval "terraform output vpc");
private_subnet_from_output=$(eval "terraform output private_subnet");
private_subnet=`echo $private_subnet_from_output | tr -d [],\"`
public_subnet_from_output=$(eval "terraform output public_subnet");
public_subnet=`echo $private_subnet_from_output | tr -d [],\"`
echo "Add tag to $vpc"
eval "aws ec2 create-tags --resources $vpc --tags Key=kubernetes.io/cluster/$name,Value=shared";
for i in  $private_subnet
do
  echo "Add tag to $i:internal-elb"
  eval "aws ec2 create-tags --resources $i --tags Key=kubernetes.io/role/internal-elb,Value=1";
done

for i in  $public_subnet
do
  echo "Add tag to $i:elb"
  eval "aws ec2 create-tags --resources $i --tags Key=kubernetes.io/role/elb,Value=1";
done
