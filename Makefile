all:
	@echo "Use 'sudo make install'."

install:
	if command -v systemctl >/dev/null 2>&1 ; then \
		install -Dm0755 systemd/rc-local.service /etc/systemd/system/rc-local.service ;\
		install -Dm0755 rc.local /etc/rc.local ;\
		systemctl enable rc-local.service ;\
		systemctl start rc-local.service ;\
	elif command -v rc-service >/dev/null 2>&1 ; then \
		install -Dm0755 openrc/rclocal /etc/init.d/rclocal ;\
		install -Dm0755 rc.local /etc/rc.local ;\
		rc-update add rclocal default ;\
		rc-service rclocal start ;\
	fi
