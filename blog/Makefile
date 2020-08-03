CMD_LINE = docker run -it --rm -v ${PWD}:/blog -u `id -u $(USER)`:`id -g $(USER)` \
		-p 8003:8000 \
		--name tinkerer-dev \
		-t takekazuomi/tinkerer:0.0.1
build::
	@ $(CMD_LINE) tinker -b

help::
	@ $(CMD_LINE) tinker -h

serve::
	@ $(CMD_LINE) python3 -m http.server 8000


