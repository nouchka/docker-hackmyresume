DOCKER_IMAGE=hackmyresume

include Makefile.docker

.PHONY: check-version
check-version:
	docker run --rm --entrypoint npm $(DOCKER_NAMESPACE)/$(DOCKER_IMAGE):$(VERSION) list -g --depth=0| grep $(DOCKER_IMAGE)| awk -F '@' '{print $$2}'
