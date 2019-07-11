OUTPUT := ./
CURL := curl -L -o

COMPANY_NAME ?= onlyoffice
PRODUCT_NAME ?= documentbuilder
PRODUCT_VERSION ?= 0.0.0

PACKAGE_EDITION ?= normal

ifeq ($(OS),Windows_NT)
    PLATFORM := win
    EXEC_EXT := .exe
    SCRIPT_EXT := .bat
    SHARED_EXT := .dll
	DEST_DIR ?= $(COMPANY_NAME)/$(PRODUCT_NAME)
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        PLATFORM := linux
        SCRIPT_EXT := .sh
        SHARED_EXT := .so*
        LIB_PREFFIX := lib
		DEST_DIR ?= /opt/$(COMPANY_NAME)/$(PRODUCT_NAME)
    endif
endif

UNAME_M := $(shell uname -m)
ifeq ($(UNAME_M),x86_64)
	ARCHITECTURE := 64
endif
ifneq ($(filter %86,$(UNAME_M)),)
	ARCHITECTURE := 32
endif

TARGET := $(PLATFORM)_$(ARCHITECTURE)

BINARY_FILES += core/build/lib/$(TARGET)/$(LIB_PREFFIX)graphics$(SHARED_EXT)
BINARY_FILES += core/build/lib/$(TARGET)/$(LIB_PREFFIX)kernel$(SHARED_EXT)
BINARY_FILES += core/build/lib/$(TARGET)/$(LIB_PREFFIX)DjVuFile$(SHARED_EXT)
BINARY_FILES += core/build/lib/$(TARGET)/$(LIB_PREFFIX)doctrenderer$(SHARED_EXT)
BINARY_FILES += core/build/lib/$(TARGET)/$(LIB_PREFFIX)HtmlFile$(SHARED_EXT)
BINARY_FILES += core/build/lib/$(TARGET)/$(LIB_PREFFIX)HtmlRenderer$(SHARED_EXT)
BINARY_FILES += core/build/lib/$(TARGET)/$(LIB_PREFFIX)PdfReader$(SHARED_EXT)
BINARY_FILES += core/build/lib/$(TARGET)/$(LIB_PREFFIX)PdfWriter$(SHARED_EXT)
BINARY_FILES += core/build/lib/$(TARGET)/$(LIB_PREFFIX)XpsFile$(SHARED_EXT)
BINARY_FILES += core/build/lib/$(TARGET)/$(LIB_PREFFIX)UnicodeConverter$(SHARED_EXT)

ifeq ($(PLATFORM),linux)
BINARY_FILES += core/Common/3dParty/icu/$(TARGET)/build/libicudata$(SHARED_EXT)
BINARY_FILES += core/Common/3dParty/icu/$(TARGET)/build/libicuuc$(SHARED_EXT)
endif

ifeq ($(PLATFORM),win)
BINARY_FILES += core/Common/3dParty/icu/$(TARGET)/build/icudt*$(SHARED_EXT)
BINARY_FILES += core/Common/3dParty/icu/$(TARGET)/build/icuuc*$(SHARED_EXT)
BINARY_FILES += core/Common/3dParty/v8/v8/out.gn/$(TARGET)/release/icudtl.dat
endif

BINARY_FILES += core/build/bin/$(TARGET)/x2t$(EXEC_EXT)
BINARY_FILES += core/build/bin/$(TARGET)/docbuilder$(EXEC_EXT)

BINARY_FILES += DoctRenderer.config

BINARY_FILES += samples$(SCRIPT_EXT)

HTML_FILE_INTERNAL := HtmlFileInternal
HTML_FILE_INTERNAL_FILES += core/build/lib/$(TARGET)/HtmlFileInternal$(EXEC_EXT)
HTML_FILE_INTERNAL_FILES += core/Common/3dParty/cef/$(TARGET)/build/**

FOLDERS += web-apps/deploy/sdkjs
FOLDERS += empty
FOLDERS += samples

JQUERY += web-apps/deploy/web-apps/vendor/jquery
XREGEXP += web-apps/deploy/web-apps/vendor/xregexp

#TODO REFACTORING FILE PATH
INCLUDE_FILES += core/DesktopEditor/doctrenderer/docbuilder.h
INCLUDE_FILES += core/DesktopEditor/common/base_export.h

DOCBUILDER_COM := core/build/lib/$(TARGET)/docbuilder.com.dll
DOCBUILDER_NET := core/build/lib/$(TARGET)/docbuilder.net.dll

.PHONY: all install uninstall

$(DOCBUILDER_COM):
	$(CURL) $(DOCBUILDER_COM) http://d2ettrnqo7v976.cloudfront.net/wrappers/$(TARGET)/docbuilder.com.dll
	
$(DOCBUILDER_NET):
	$(CURL) $(DOCBUILDER_NET) http://d2ettrnqo7v976.cloudfront.net/wrappers/$(TARGET)/docbuilder.net.dll

all:
	cd core/Common/3dParty/ && ./make.sh
	cd core && $(MAKE) all ext

	cd sdkjs && $(MAKE)
	
clean:
	cd core && $(MAKE) clean
	cd core-ext && $(MAKE) clean
	cd sdkjs &&  $(MAKE) clean

install: $(DOCBUILDER_COM) $(DOCBUILDER_NET)
	mkdir -p $(DEST_DIR)
	cp -t $(DEST_DIR) $(BINARY_FILES)
ifneq ($(PLATFORM),mac)
	mkdir -p $(DEST_DIR)/$(HTML_FILE_INTERNAL)
	cp -r -t $(DEST_DIR)/$(HTML_FILE_INTERNAL) $(HTML_FILE_INTERNAL_FILES)
endif
	cp -r -t $(DEST_DIR) $(FOLDERS)
	mkdir -p $(DEST_DIR)/sdkjs/vendor
	cp -r -t $(DEST_DIR)/sdkjs/vendor $(JQUERY) $(XREGEXP)
	mkdir -p $(DEST_DIR)/include
	cp -t $(DEST_DIR)/include $(INCLUDE_FILES)
ifeq ($(PLATFORM),win)
	mkdir -p $(DEST_DIR)/wrappers
	cp -t $(DEST_DIR)/wrappers $(DOCBUILDER_COM) $(DOCBUILDER_NET)
endif

ifeq ($(PACKAGE_EDITION),portable)
	for i in $(DEST_DIR)/*;	do \
		./dependencies.sh $${i} $(DEST_DIR)/system ; \
	done
	cd $(DEST_DIR) && patchelf --set-interpreter ./system/ld-linux-x86-64.so.2 ./x2t
endif

uninstall:
	rm -fr $(DEST_DIR)
