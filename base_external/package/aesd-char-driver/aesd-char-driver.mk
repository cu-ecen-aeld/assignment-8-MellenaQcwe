
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_CHAR_DRIVER_VERSION =
AESD_CHAR_DRIVER_SITE = $(AESD_CHAR_DRIVER_OVERRIDEN_SRCDIR)
AESD_CHAR_DRIVER_SITE_METHOD = local
ifeq ($(AESD_CHAR_DRIVER_OVERRIDEN_SRCDIR),)
	AESD_CHAR_DRIVER_VERSION = 35552a7830571be618454a2b9a21edc935e96d55
	AESD_CHAR_DRIVER_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-MellenaQcwe.git
	AESD_CHAR_DRIVER_SITE_METHOD = git
	AESD_CHAR_DRIVER_GIT_SUBMODULES = YES
endif

AESD_CHAR_DRIVER_MODULE_SUBDIRS += aesd-char-driver
#AESD_CHAR_DRIVER_MODULE_MAKE_OPTS # Not extra opt to the build system

define AESD_CHAR_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
