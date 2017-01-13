run:
	vagrant plugin install vagrant-hostsupdater
	(cd vagrant && vagrant up)
	(cd exploit && chmod +x exploit.sh && sh exploit.sh)
	(cd exploit && chmod +x list_admins.sh && sh list_admins.sh)

clean:
	(cd vagrant && vagrant destroy -f)
