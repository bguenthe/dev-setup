::echo off

cd provisioning
if not exist .secrets (mkdir .secrets)
cd ..

copy g:\.ssh\id_rsa provisioning\.secrets
copy g:\.ssh\id_rsa.pub provisioning\.secrets

copy  %UserProfile%\.aws\credentials provisioning\.secrets

vagrant plugin install vagrant-serverspec
vagrant up
