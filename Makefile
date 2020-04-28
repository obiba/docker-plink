#
# Docker helper
#

no_cache=false

# Build Docker image
build:
	sudo docker build --no-cache=$(no_cache) -t="obiba/plink:snapshot" .

up:
	sudo docker-compose up -d

container-ip:
	sudo docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' docker-plink_server_1

seed:
	mkdir -p data/brge && \
		cd data/brge && \
		chmod -R a+w . && \
		rm brge.* && \
		wget https://github.com/isglobal-brge/brgedata/raw/master/inst/extdata/brge.bed && \
		wget https://github.com/isglobal-brge/brgedata/raw/master/inst/extdata/brge.bim && \
		wget https://github.com/isglobal-brge/brgedata/raw/master/inst/extdata/brge.fam && \
		wget https://github.com/isglobal-brge/brgedata/raw/master/inst/extdata/brge.phe && \
		wget https://github.com/isglobal-brge/brgedata/raw/master/inst/extdata/brge.txt && \
		chmod -R a-w .

bash:
	sudo docker exec -i -t docker-plink_server_1 /bin/bash
