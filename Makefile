.DEFAULT_GOAL := help

help:
	@echo "Type: make [rule]. Available options are:"
	@echo ""
	@echo "- help"
	@echo ""
	@echo "- build-xcode"
	@echo "- build-makefile"
	@echo ""
	@echo "- check-xcode"
	@echo "- check-makefile"
	@echo ""

build-xcode:
	rm -rf out/build-xcode
	mkdir -p out/build-xcode
	mkdir -p out/build-xcode/armv7
	mkdir -p out/build-xcode/arm64

	cd out/build-xcode/armv7 && \
		cmake -G "Xcode" ../../../cmake/ -DPROJECT_CONFIG_ARCH=armv7 && \
		cmake --build . --config Release && \
		cmake --install . --strip

	cd out/build-xcode/arm64 && \
		cmake -G "Xcode" ../../../cmake/ -DPROJECT_CONFIG_ARCH=arm64 && \
		cmake --build . --config Release && \
		cmake --install . --strip

build-makefile:
	rm -rf out/build-makefile
	mkdir -p out/build-makefile
	mkdir -p out/build-makefile/armv7
	mkdir -p out/build-makefile/arm64

	cd out/build-makefile/armv7 && \
		cmake -G "Unix Makefiles" ../../../cmake/ -DPROJECT_CONFIG_ARCH=armv7 && \
		cmake --build . --config Release && \
		cmake --install . --strip

	cd out/build-makefile/arm64 && \
		cmake -G "Unix Makefiles" ../../../cmake/ -DPROJECT_CONFIG_ARCH=arm64 && \
		cmake --build . --config Release && \
		cmake --install . --strip

check-xcode:
	file out/dist/armv7/Sample.framework/Versions/A/Sample
	file out/dist/arm64/Sample.framework/Versions/A/Sample

check-makefile:
	file out/dist/armv7/Sample.framework/Versions/A/Sample
	file out/dist/arm64/Sample.framework/Versions/A/Sample
