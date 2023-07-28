
##############################################################
#
# LDD
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = db069bab53f6b6ba6bf7f754a0b4e0cf4e3f7ce7
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-coreyHan2013.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

define LDD_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) ARCH=${KERNEL_ARCH} KERNELDIR=${LINUX_DIR} -C $(@D)/misc-modules modules
	$(MAKE) $(TARGET_CONFIGURE_OPTS) ARCH=${KERNEL_ARCH} KERNELDIR=${LINUX_DIR} -C $(@D)/scull modules
endef

define LDD_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) INSTALL_MOD_PATH=${TARGET_DIR} KERNELDIR=${LINUX_DIR} -C $(@D)/misc-modules modules_install
	$(TARGET_MAKE_ENV) $(MAKE) INSTALL_MOD_PATH=${TARGET_DIR} KERNELDIR=${LINUX_DIR} -C $(@D)/scull modules_install
endef

$(eval $(kernel-module))
$(eval $(generic-package))
