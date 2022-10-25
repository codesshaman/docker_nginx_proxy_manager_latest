name = docker_configuration
all:
	@printf "Запуск конфигурации ${name}...\n"
	@docker-compose -f ./docker-compose.yml up -d
build:
        @printf "Building configuration ${name}...\n"
        @docker-compose -f ./docker-compose.yml up -d --build
down:
	@printf "Остановка конфигурации ${name}...\n"
	@docker-compose -f ./docker-compose.yml down
re:	down
	@printf "Пересборка конфигурации ${name}...\n"
	@docker-compose -f ./docker-compose.yml up -d --build
clean: down
	@printf "Очистка конфигурации ${name}...\n"
	@docker system prune --a
fclean:
	@printf "Полная очистка всех конфигураций docker\n"
#	@docker stop $$(docker ps -qa)
#	@docker system prune --all --force --volumes
#	@docker network prune --force
#	@docker volume prune --force
.PHONY	: all build down re clean fclean
