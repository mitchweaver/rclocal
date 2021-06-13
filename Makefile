all: 
	@echo "Use 'sudo make install'."

install:
	install -Dm0755 rc-local.service /etc/systemd/system/rc-local.service
	install -Dm0755 rc.local /etc/rc.local
	systemctl enable rc-local.service
	systemctl start rc-local.service
