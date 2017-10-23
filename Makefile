IMAGE=emu-software.img
DEF=emu-software.def

.PHONY: bootstrap

all: bootstrap

${IMAGE}:
	sudo singularity create -s 20480 ${IMAGE}

bootstrap: ${IMAGE}
	sudo singularity bootstrap ${IMAGE} ${DEF}

upgrade:
	sudo singularity exec --writable ${IMAGE} apt-get update
	sudo singularity exec --writable ${IMAGE} apt-get upgrade
