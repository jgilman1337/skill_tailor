### SIMPLE MAKEFILE TEMPLATE FOR GO PROJECTS ###

## Set your project-specific stuff here
NAME := bullet_tailor
BIN_DIR := ./build
MAIN_DIR := ./cmd

## ----
## DO NOT EDIT BELOW THIS LINE ##
## ----

GO := go

# Automatically append .exe if on Windows and pick the correct commands
ifeq ($(OS),Windows_NT)
	EXE := .exe
	RM := rmdir /S /Q
	MKDIR := if not exist $(BIN_DIR) mkdir $(BIN_DIR)
else
	EXE :=
	RM := rm -rf
	MKDIR := mkdir -p $(BIN_DIR)
endif

# Builds the project
.PHONY: build
build:
	@$(MKDIR)
	$(GO) build -o $(BIN_DIR)/$(NAME)$(EXE) $(MAIN_DIR)/$(NAME).go

# Cleans up build directories
.PHONY: clean
clean:
	@$(RM) $(BIN_DIR)

# Runs the project
.PHONY: run
run:
	$(GO) run $(MAIN_DIR)/$(NAME).go
