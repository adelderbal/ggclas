ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:11.0
THEOS_DEVICE_IP = x.x.x.x
THEOS_DEVICE_PORT = 22

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PreferenceExam

PreferenceExam_FILES = Tweak.x
PreferenceExam_CFLAGS = -fobjc-arc

SUBPROJECTS += prefexam


include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
