
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

LDD_VERSION =
LDD_SITE = $(LDD_OVERRIDEN_SRCDIR)
LDD_SITE_METHOD = local
ifeq ($(LDD_OVERRIDEN_SRCDIR),)
	LDD_VERSION = dd155dc4aec371ca8a5d14396f2ab320afc5de93
	LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-MellenaQcwe.git
	LDD_SITE_METHOD = git
	LDD_GIT_SUBMODULES = YES
endif
LDD_MODULE_SUBDIRS = scull
LDD_MODULE_SUBDIRS += misc-modules

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
