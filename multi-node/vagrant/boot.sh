#!/usr/bin/env bash
vagrant box update

vagrant up

kubectl config \
	set-cluster vagrant-multi-cluster \
	--server=https://c1.localdomain.com:443 \
	--certificate-authority=${PWD}/ssl/ca.pem

kubectl config \
	set-credentials vagrant-multi-admin \
	--certificate-authority=${PWD}/ssl/ca.pem \
	--client-key=${PWD}/ssl/admin-key.pem \
	--client-certificate=${PWD}/ssl/admin.pem

kubectl config \
	set-context vagrant-multi \
	--cluster=vagrant-multi-cluster \
	--user=vagrant-multi-admin

kubectl config use-context vagrant-multi
kubectl get nodes
