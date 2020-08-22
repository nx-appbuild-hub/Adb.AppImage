DESTINATION="Adb.AppImage"

all:
	echo "Building: $(OUTPUT)"
	wget --output-document=build.zip --continue https://dl.google.com/android/repository/platform-tools-latest-linux.zip
	unzip ./build.zip -d ./build


	mkdir -p AppDir/application
	cp --recursive build/platform-tools/* AppDir/application
	chmod +x AppDir/application/*
	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(DESTINATION)
	chmod +x $(DESTINATION)

	rm -rf ./AppDir/application
	rm -rf ./build.zip
	rm -rf ./build
