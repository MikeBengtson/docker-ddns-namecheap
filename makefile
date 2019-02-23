include env_make

NS = soflo1
VERSION = 1.0
REPO = ddns-namecheap
NAME = docker-ddns-namecheap
INSTANCE = default

.PHONY: build pull push start stop rm release 

build:
	docker build -t $(NS)/$(REPO):$(VERSION) docker_namecheapddns

push:
	docker push $(NS)/$(REPO):$(VERSION)

pull:
	docker pull $(NS)/$(REPO):$(VERSION)
			
start:
	docker run -d --name $(NAME)-$(INSTANCE) $(RUN_FLAG) $(DOMAIN) $(HOSTS) $(PASSWORD) $(NS)/$(REPO):$(VERSION)

stop:
	docker stop $(NAME)-$(INSTANCE)
							
rm:
	docker rm $(NAME)-$(INSTANCE)
								
release: build
	make push -e VERSION=$(VERSION)

default: build

