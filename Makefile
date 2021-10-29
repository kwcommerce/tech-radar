include /usr/local/lib/kw-automation/lib.mk

export NAME 		= kw-tech-radar
export ENVIRONMENT 	?= dev


push: 			api-push
deploy: 		api-deploy-to-swarm

build:
	@echo "Building Docker image"
	docker build -t $(NAME)_nginx:$(VERSION) --build-arg registry=$(REGISTRY) .

jenkins-build:
	@echo "Building Docker image"
	docker build --no-cache -t $(NAME)_nginx:$(VERSION) --build-arg registry=$(REGISTRY) .

push: ecr-create-repo
push:
	-aws ecr create-repository --repository-name $(NAME)_nginx --region $(AWS_REGION) 2> /dev/null
	docker tag $(NAME)_nginx:$(VERSION) $(REGISTRY)/$(NAME)_nginx:$(VERSION)
	docker push $(REGISTRY)/$(NAME)_nginx:$(VERSION)

check-image-exists:
	@aws ecr list-images --repository-name $(NAME)_nginx --query 'imageIds[?imageTag==`$(VERSION)`]' --region $(AWS_REGION) --output text | grep $(VERSION)
