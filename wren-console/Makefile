.PHONY: install docker.build premake deps build.macos

WRENC=util/wrenc/macos/wrenc

install i:
	@make deps
	@make premake
	@make docker.build

deps d:
	@rm -rf wren_modules
	@rm -rf deps/wren-essentials
	@mkdir -p wren_modules
	@cd wren_modules && git clone git@github.com:joshgoebel/wren-package.git
	@rm -rf wren_modules/wren-package/.git
	@rm -rf wren_modules/wren-testie/.git
	@rm -rf wren_modules/wren-assert/.git
	@cd deps && git clone git@github.com:joshgoebel/wren-essentials.git
	@rm -rf deps/wren-essentials/.git
	@${WRENC} package.wren install

docker.build db:
	@docker build -t wren-console .
	@docker create --name wrenc wren-console
	@docker cp wrenc:/wrenc/bin bin/
	@docker rm -f wrenc

premake p:
	@python3 util/generate_projects.py

build.macos bm:
	@cd projects/make.mac && make clean && make
