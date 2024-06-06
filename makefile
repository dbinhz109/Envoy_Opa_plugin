.PHONY: rs

rs:
	@docker stop go-service
	@docker rm go-service
	@docker build -t go-service .
	@docker run -d --name go-service --network=opa-envoy-net go-service