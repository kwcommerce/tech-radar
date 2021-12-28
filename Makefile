include /usr/local/lib/kw-automation/lib.mk

export NAME 		= kw-tech-radar
export ENVIRONMENT 	?= dev


deploy: 		api-deploy-to-swarm

build:
	@echo "Building Docker image"
	docker build -t $(NAME):$(VERSION) --build-arg registry=$(REGISTRY) .

jenkins-build:
	@echo "Building Docker image"
	docker build --no-cache -t $(NAME):$(VERSION) --build-arg registry=$(REGISTRY) .

push: ecr-create-repo
push:
	-aws ecr create-repository --repository-name $(NAME) --region $(AWS_REGION) 2> /dev/null
	docker tag $(NAME):$(VERSION) $(REGISTRY)/$(NAME):$(VERSION)
	docker push $(REGISTRY)/$(NAME):$(VERSION)

check-image-exists:
	@aws ecr list-images --repository-name $(NAME) --query 'imageIds[?imageTag==`$(VERSION)`]' --region $(AWS_REGION) --output text | grep $(VERSION)
