build::
	docker build -t takekazuomi/tinkerer:0.0.1 .

tinker::
	@ docker run -it --rm -v ${PWD}:/blog -u `id -u $(USER)`:`id -g $(USER)` \
		--name tinkerer-dev \
		-t takekazuomi/tinkerer:0.0.1

push::
	docker push takekazuomi/tinkerer:0.0.1
