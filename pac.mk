# Inherit AOSP device configuration for inc.
$(call inherit-product, device/hp/tenderloin/device_tenderloin.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/pac/config/common_full_tablet_wifionly.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := pac_tenderloin
PRODUCT_BRAND := HP
PRODUCT_DEVICE := tenderloin
PRODUCT_MODEL := Touchpad
PRODUCT_RELEASE_NAME := touchpad
PRODUCT_MANUFACTURER := HP
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=touchpad \
    BUILD_FINGERPRINT="hp/hp_tenderloin/tenderloin:6.0/MRA58K/2256973:user/release-keys" \
    PRIVATE_BUILD_DESC="tenderloin-user 6.0 MRA58K 2256973 release-keys" \
    BUILD_NUMBER=228551

# Set up the product codename, build version & MOTD.
PRODUCT_CODENAME := Queo
PRODUCT_VERSION_DEVICE_SPECIFIC := p1

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing PAC-ROM for your HP Touchpad\n------------------------------------------------\n"

# Bootanimation
TARGET_BOOTANIMATION_HALF_RES := true
BOOT_ANIMATION_SIZE := xga
