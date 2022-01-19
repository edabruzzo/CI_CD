
DIRETORIO_SERVICO_DOCKER=/etc/systemd/system/docker.service.d/

mkdir -p $DIRETORIO_SERVICO_DOCKER

touch $DIRETORIO_SERVICO_DOCKER/override.conf

cat << EOF >> $DIRETORIO_SERVICO_DOCKER/override.conf

	[Service] 
	ExecStart= 
	ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2376
EOF 
	
sudo systemctl daemon-reload
sudo systemctl restart docker.service 
