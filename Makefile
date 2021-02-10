.DEFAULT_GOAL := help

help:
	@echo "Type: make [rule]. Available options are:"
	@echo ""
	@echo "- help"
	@echo "- build"
	@echo "- check"
	@echo ""

build:
	rm -rf out/build
	mkdir -p out/build
	mkdir -p out/build/armv7
	mkdir -p out/build/arm64

	cd out/build/armv7 && \
		cmake -G Xcode ../../../cmake/ -DPROJECT_CONFIG_ARCH=armv7 && \
		cmake --build . --config Release && \
		cmake --install . --strip

	cd out/build/arm64 && \
		cmake -G Xcode ../../../cmake/ -DPROJECT_CONFIG_ARCH=arm64 && \
		cmake --build . --config Release && \
		cmake --install . --strip

check:
	file out/dist/armv7/Sample.framework/Versions/A/Sample
	file out/dist/arm64/Sample.framework/Versions/A/Sample
