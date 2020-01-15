ARCHS = arm64 arm64e
TARGET = iphone:clang:11.2:11.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = prefexam

prefexam_FILES = $(wildcard *.m)
prefexam_INSTALL_PATH = /Library/PreferenceBundles
prefexam_FRAMEWORKS = UIKit
prefexam_PRIVATE_FRAMEWORKS = Preferences
prefexam_CFLAGS = -fobjc-arc -include log.h

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/prefexam.plist$(ECHO_END)
