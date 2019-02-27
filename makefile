SHELL:=/bin/bash

define lib_prepare_task =
	@pushd lib >& /dev/null;
	@ldconfig -N . ;
	@find . -type f -name \*.so.\* \
	| while read lib; do
		ln -sfn "${lib}" "${lib%.so.*}.so"
	done
	@popd >& /dev/null;
endef

lib-prepare: ; $(value lib_prepare_task)

.ONESHELL:

all: cgogen

cgogen:
	cgogen mcloud.yml

build: cgogen lib-prepare
	cd mcloud && go build -x -v

install: build
	cd mcloud && go install

clean:
	find lib -type l -delete
	rm -f mcloud/cgo_helpers.go mcloud/cgo_helpers.h mcloud/cgo_helpers.c
	rm -f mcloud/doc.go mcloud/types.go mcloud/const.go
	rm -f mcloud/mcloud.go

test:
	cd mcloud && go build -x -v
