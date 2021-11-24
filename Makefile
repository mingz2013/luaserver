.PHONY: help
help:
	@echo '                                                                          '
	@echo 'Makefile for gitbook doc                                                  '
	@echo '                                                                          '
	@echo 'Usage:                                                                    '
	@echo '   make help                           show help                          '
	@echo '                                                                          '
	@echo '   make up                             启动服务                            '
	@echo '   make down                           停止服务                            '
	@echo '   make logs                           查看日志                            '
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
	docker build . -t luaserver

.PHONY:run
run:
	docker run -it --rm luaserver