help::		## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build::		## build docker image.
	docker build -t takekazuomi/tinkerer:1.7.2 .

tinker::	## exec tinker ${CMD}
	@docker run -it --rm -v ${PWD}/blog:/blog -u `id -u $(USER)`:`id -g $(USER)` \
		--name tinkerer-dev \
		-t takekazuomi/tinkerer:1.7.2 ${CMD}

push::		## push docker image.
	docker push takekazuomi/tinkerer:1.7.2
