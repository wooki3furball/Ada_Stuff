# Author: Michael Bopp
# Date Created: 07/04/24
# Last Modified: 07/04/24

# Detect OS & build dir/dir/Makefile path.
ifeq ($(OS),Windows_NT)
    PATH_COMPONENTS = $(subst \, ,$(subst /, ,$(CURDIR)))
    CURRENT_DIR_NAME = $(lastword $(PATH_COMPONENTS))
    PATH_WITHOUT_LAST_DIR = $(filter-out $(CURRENT_DIR_NAME),$(PATH_COMPONENTS))
    PARENT_DIR_NAME = $(lastword $(PATH_WITHOUT_LAST_DIR))
    CUR_DIR = $(PARENT_DIR_NAME)\\$(CURRENT_DIR_NAME)\\Makefile
else
    CURRENT_DIR_NAME = $(notdir $(CURDIR))
    PARENT_DIR_FULL_PATH = $(dir $(CURDIR))
    PARENT_DIR_NAME = $(notdir $(patsubst %/,%,$(PARENT_DIR_FULL_PATH)))
    CUR_DIR = $(PARENT_DIR_NAME)/$(CURRENT_DIR_NAME)/Makefile
endif

# Text Coloring
BLUE=\033[34m
GREEN=\033[32m
YELLOW=\033[33m
RESET=\033[0m

# Variables
GNATMAKE = gnatmake
SRC ?= CLI_Test/cli.adb   # Need this variable to be configurable
BUILD_DIR = output/
EXEC = $(BUILD_DIR)/$(basename $(notdir $(SRC)))
CARGS = -cargs -I./$(BUILD_DIR)
BARGS = -bargs -aO./$(BUILD_DIR)


# Create build directory if it doesn't exist
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Target to build the main executable
$(EXEC): $(SRC) | $(BUILD_DIR)
	$(GNATMAKE) -o $(EXEC) $(SRC) $(CARGS) $(BARGS)

# Default Target
all: $(EXEC)

# Run like Go (Variadic Arguments)
run: $(EXEC)
	./$(EXEC) $(ARGS)

# Clean
clean:
	clean:
	rm -rf $(BUILD_DIR)
	rm -f $(EXEC)

# Log command
log:

# List the labels of the Makefile.
list:
	@echo -e "$(GREEN)Directory: $(YELLOW)$(CUR_DIR)$(RESET)"
	@echo -e "$(GREEN)Available targets in Makefile:$(RESET)"
	@GREP_COLORS="mt=01;96" grep --color=always '^[a-zA-Z0-9_-]*:' Makefile | cut -d':' -f1 | grep -vE 'list|listc'
# List the labels & commands of them in the Makefile.
listc:
	@echo -e "$(GREEN)Directory: $(YELLOW)$(CUR_DIR)$(RESET)"
	@echo -e "$(GREEN)Available targets in Makefile:$(RESET)"
	@GREP_COLORS="mt=01;96" grep --color=always -A1 '^[a-zA-Z0-9_-]*:' Makefile | grep -v -- '--' | grep -vE 'list:|@echo'