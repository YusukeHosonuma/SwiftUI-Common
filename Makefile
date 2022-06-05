.PHONY: setup
setup:
	mint bootstrap

.PHONY: format
format:
	mint run swiftformat .
