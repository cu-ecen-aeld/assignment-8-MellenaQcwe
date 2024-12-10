
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_VERSION = 
AESD_ASSIGNMENTS_SITE = $(AESD_ASSIGNMENTS_OVERRIDEN_SRCDIR)
AESD_ASSIGNMENTS_SITE_METHOD = local
ifeq ($(AESD_ASSIGNMENTS_OVERRIDEN_SRCDIR),)
	AESD_ASSIGNMENTS_VERSION = 66f200c6144d569ef148224a3f02e227fc3f848e
	AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-MellenaQcwe.git
	AESD_ASSIGNMENTS_SITE_METHOD = git
	AESD_ASSIGNMENTS_GIT_SUBMODULES = YES
endif

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)/finder-app all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)/server all
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/finder-app/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/finder-app/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh ${TARGET_DIR}/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh ${TARGET_DIR}/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/writer ${TARGET_DIR}/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/autorun-qemu.sh ${TARGET_DIR}/usr/bin
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin

	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))
