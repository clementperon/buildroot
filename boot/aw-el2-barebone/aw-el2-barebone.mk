################################################################################
#
# aw-el2-barebone
#
################################################################################

AW_EL2_BAREBONE_VERSION = 80eabe21acc997f59b000d0e3f53dbcf4f09cedf
AW_EL2_BAREBONE_SITE = $(call github,Icenowy,aw-el2-barebone,$(AW_EL2_BAREBONE_VERSION))
AW_EL2_BAREBONE_LICENSE = GPLv2
AW_EL2_BAREBONE_LICENSE_FILES = LICENSE
AW_EL2_BAREBONE_INSTALL_IMAGES = YES

AW_EL2_BAREBONE_MAKE_ENV = CROSS_COMPILE=$(TARGET_CROSS)
AW_EL2_BAREBONE_IMG_DIR = $(@D)

define AW_EL2_BAREBONE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(AW_EL2_BAREBONE_MAKE_ENV) $(MAKE) -C $(@D)
endef

define AW_EL2_BAREBONE_INSTALL_IMAGES_CMDS
        $(INSTALL) -m 0644 $(AW_EL2_BAREBONE_IMG_DIR)/el2-bb.bin \
                $(BINARIES_DIR)/hyp.bin
endef

$(eval $(generic-package))
