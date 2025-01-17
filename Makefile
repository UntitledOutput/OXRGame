# Alternative GNU Make workspace makefile autogenerated by Premake

ifndef config
  config=debug_x64
endif

ifndef verbose
  SILENT = @
endif

ifeq ($(config),debug_x64)
  raylib_config = debug_x64
  vscode_raylib_config = debug_x64

else ifeq ($(config),debug_x86)
  raylib_config = debug_x86
  vscode_raylib_config = debug_x86

else ifeq ($(config),release_x64)
  raylib_config = release_x64
  vscode_raylib_config = release_x64

else ifeq ($(config),release_x86)
  raylib_config = release_x86
  vscode_raylib_config = release_x86

else
  $(error "invalid configuration $(config)")
endif

PROJECTS := raylib vscode-raylib

.PHONY: all clean help $(PROJECTS) 

all: $(PROJECTS)

raylib:
ifneq (,$(raylib_config))
	@echo "==== Building raylib ($(raylib_config)) ===="
	@${MAKE} --no-print-directory -C _build -f raylib.make config=$(raylib_config)
endif

vscode-raylib: raylib
ifneq (,$(vscode_raylib_config))
	@echo "==== Building vscode-raylib ($(vscode_raylib_config)) ===="
	@${MAKE} --no-print-directory -C _build -f vscode-raylib.make config=$(vscode_raylib_config)
endif

clean:
	@${MAKE} --no-print-directory -C _build -f raylib.make clean
	@${MAKE} --no-print-directory -C _build -f vscode-raylib.make clean

help:
	@echo "Usage: make [config=name] [target]"
	@echo ""
	@echo "CONFIGURATIONS:"
	@echo "  debug_x64"
	@echo "  debug_x86"
	@echo "  release_x64"
	@echo "  release_x86"
	@echo ""
	@echo "TARGETS:"
	@echo "   all (default)"
	@echo "   clean"
	@echo "   raylib"
	@echo "   vscode-raylib"
	@echo ""
	@echo "For more information, see https://github.com/premake/premake-core/wiki"