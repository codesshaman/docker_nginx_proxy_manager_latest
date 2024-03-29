name = nginx proxy manager

NO_COLOR=\033[0m		# Color Reset
COLOR_OFF='\e[0m'       # Color Off
OK_COLOR=\033[32;01m	# Green Ok
ERROR_COLOR=\033[31;01m		# Error red
WARN_COLOR=\033[33;01m	# Warning yellow
RED='\e[1;31m'          # Red
GREEN='\e[1;32m'        # Green
YELLOW='\e[1;33m'       # Yellow
BLUE='\e[1;34m'         # Blue
PURPLE='\e[1;35m'       # Purple
CYAN='\e[1;36m'         # Cyan
WHITE='\e[1;37m'        # White
UCYAN='\e[4;36m'        # Cyan

all:
	@printf "Launch configuration ${name}...\n"
	@docker-compose -f ./docker-compose.yml up -d

help:
	@echo -e "$(OK_COLOR)==== All commands of ${name} configuration ====$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- make				: Launch configuration"
	@echo -e "$(WARN_COLOR)- make build			: Building configuration"
	@echo -e "$(WARN_COLOR)- make down			: Stopping configuration"
	@echo -e "$(WARN_COLOR)- make logs			: Show container logs"
	@echo -e "$(WARN_COLOR)- make logdb		: Show database logs"
	@echo -e "$(WARN_COLOR)- make ps			: Show configuration containers"
	@echo -e "$(WARN_COLOR)- make re			: Rebuild configuration"
	@echo -e "$(WARN_COLOR)- make clean			: Cleaning configuration$(NO_COLOR)"

build:
	@printf "$(OK_COLOR)==== Building configuration ${name}... ====$(NO_COLOR)\n"
	@docker-compose -f ./docker-compose.yml up -d --build

conn:
	@printf "$(OK_COLOR)==== Connecting to container ${name}... ====$(NO_COLOR)\n"
	@docker-compose -f ./docker-compose.yml exec npm sh

connroot:
	@printf "$(OK_COLOR)==== Connecting with root ${name}... ====$(NO_COLOR)\n"
	@docker-compose -f ./docker-compose.yml exec --user root npm sh

down:
	@printf "$(ERROR_COLOR)==== Stopping configuration ${name}... ====$(NO_COLOR)\n"
	@docker-compose -f ./docker-compose.yml down

logs:
	@printf "$(WARN_COLOR)==== Show logs ${name}... ====$(NO_COLOR)\n"
	@docker-compose -f ./docker-compose.yml logs npm

logdb:
	@printf "$(WARN_COLOR)==== Show logs ${name}... ====$(NO_COLOR)\n"
	@docker-compose -f ./docker-compose.yml logs npmdb

re:	down
	@printf "Пересборка конфигурации ${name}...\n"
	@docker-compose -f ./docker-compose.yml up -d --build

ps:
	@printf "$(BLUE)==== View configuration ${name}... ====$(NO_COLOR)\n"
	@docker-compose -f ./docker-compose.yml ps

clean: down
	@printf "$(ERROR_COLOR)==== Cleaning configuration ${name}... ====$(NO_COLOR)\n"
	@docker system prune -a

fclean:
	@printf "$(ERROR_COLOR)==== Total clean of all configurations docker ====$(NO_COLOR)\n"
	# @docker stop $$(docker ps -qa)
	# @docker system prune --all --force --volumes
	# @docker network prune --force
	# @docker volume prune --force

.PHONY	: all help build conn down re ps clean fclean
