DEVELOPER_DIR=`xcode-select -p` # Xcode 13.3.1

.PHONY: build
format:
	mint run swiftformat .

.PHONY: build
build:
	swift build -Xswiftc -sdk -Xswiftc ${DEVELOPER_DIR}/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator15.4.sdk -Xswiftc -target -Xswiftc x86_64-apple-ios15.4-simulator 
