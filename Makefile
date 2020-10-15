.PHONY: all clean

TOP=.
BUILD_DIR=./build
BIN_DIR=./bin

INCLUDE_DIR=$(BUILD_DIR)/include
BUILD_CLUALIB_DIR=$(BUILD_DIR)/clualib
BUILD_CSERVICE_DIR=$(BUILD_DIR)/cservice
BUILD_CLIB_DIR=$(BUILD_DIR)/clib

LUA_BIN="./skynet/3rd/lua/lua"
export LUA_CPATH=$(TOP)/$(BUILD_CLUALIB_DIR)/?.so
export LUA_PATH=$(TOP)/lualib/?.lua;$(TOP)/skynet/lualib/?.lua;

all: build

build:
	-mkdir -p $(BUILD_DIR)
	-mkdir -p $(BIN_DIR)
	-mkdir -p $(INCLUDE_DIR)
	-mkdir -p $(BUILD_CLUALIB_DIR)
	-mkdir -p $(BUILD_CSERVICE_DIR)
	-mkdir -p $(BUILD_CLIB_DIR)

.PHONY: skynet
all: skynet
SKYNET_MAKEFILE=skynet/Makefile
$(SKYNET_MAKEFILE):
	git submodule update --init
SKYNET_DEP_PATH= SKYNET_BUILD_PATH=../$(BIN_DIR) \
		LUA_CLIB_PATH=../$(BUILD_CLUALIB_DIR) \
		CSERVICE_PATH=../$(BUILD_CSERVICE_DIR)
build-skynet: | $(SKYNET_MAKEFILE)
	cd skynet && $(MAKE) PLAT=linux $(SKYNET_DEP_PATH)

skynet: build-skynet
	cp skynet/skynet-src/skynet_malloc.h $(INCLUDE_DIR)
	cp skynet/skynet-src/skynet.h $(INCLUDE_DIR)
	cp skynet/skynet-src/skynet_env.h $(INCLUDE_DIR)
	cp skynet/skynet-src/skynet_socket.h $(INCLUDE_DIR)
	cp skynet/3rd/lua/*.h $(INCLUDE_DIR)
	cp skynet/3rd/lua/lua $(BIN_DIR)

define CLEAN_SKYNET
	cd skynet && $(MAKE) $(SKYNET_DEP_PATH) clean
endef
CLEAN_ALL += $(CLEAN_SKYNET)

all: nest

CFLAGS = -g3 -O2 -rdynamic -Wall -I$(INCLUDE_DIR)
LDFLAGS = -L$(BUILD_CLIB_DIR) -Wl,-rpath $(BUILD_CLIB_DIR) -pthread -lm -ldl -lrt
SHARED = -fPIC --shared

CLIB_TARGET=$(patsubst %, $(BUILD_CLIB_DIR)/lib%.so, $(CLIB))
CLUALIB_TARGET=$(patsubst %, $(BUILD_CLUALIB_DIR)/%.so, $(CLUALIB))
CSERVICE_TARGET=$(patsubst %, $(BUILD_CSERVICE_DIR)/%.so, $(CSERVICE))

nest: $(CLIB_TARGET) \
	$(CLUALIB_TARGET) \
	$(CSERVICE_TARGET)

clean:
	-rm -rf build
	-rm -rf bin 
	$(CLEAN_ALL)
