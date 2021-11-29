.PHONY: help
help:
	@echo '                                                                          '
	@echo 'Makefile for luaserver                                                    '
	@echo '                                                                          '
	@echo 'Usage:                                                                    '
	@echo '   make help                           show help                          '
	@echo '                                                                          '
	@echo '   make up                             start server                       '
	@echo '   make down                           end server                         '
	@echo '   make logs                           show logs                          '
	@echo '   make build                          build docker                       '
	@echo '   make run                            run                                '
	@echo '                                                                          '
	@echo '                                                                          '


.PHONY: up
up:
	docker-compose  up -d


.PHONY: down
down:
	docker-compose  down


.PHONY: logs
logs:
	docker-compose  logs -f


.PHONY: build
build:
	docker build . -t mingz2013/luaserver
	docker push mingz2013/luaserver

.PHONY:run
run:
	docker run -it --rm mingz2013/luaserver