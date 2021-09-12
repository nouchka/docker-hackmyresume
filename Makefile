DOCKER_IMAGE=hackmyresume

include Makefile.docker

.PHONY: check-version
check-version:
	docker run --rm $(DOCKER_NAMESPACE)/$(DOCKER_IMAGE):$(VERSION) version
