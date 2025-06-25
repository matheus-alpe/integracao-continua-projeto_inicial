.PHONY: lint test start stop ci
lint:
	docker run --rm -itv $(CURDIR):/app -w /app golangci/golangci-lint golangci-lint run ./...
test:
	docker compose exec app go test -v *.go
start:
	docker compose up -d
stop:
	docker compose down
ci: start lint test
