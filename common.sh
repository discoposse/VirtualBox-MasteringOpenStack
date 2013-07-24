# Add host entries
echo "
172.16.0.200	controller.book controller
172.16.0.201	compute.book compute
172.16.0.202	network.book network
172.16.0.210	swift.book swift
172.16.0.211	iscsi.book iscsi" | tee -a /etc/hosts