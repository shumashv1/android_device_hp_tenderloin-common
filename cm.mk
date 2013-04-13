$(call inherit-product, device/hp/tenderloin/device_tenderloin.mk)

PRODUCT_RELEASE_NAME := Touchpad

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=touchpad BUILD_FINGERPRINT=hp/hp_tenderloin/tenderloin:4.2.2/JDQ39/573038:user/release-keys PRIVATE_BUILD_DESC="tenderloin-user 4.2.2 JDQ39 573038 release-keys"

PRODUCT_NAME := cm_tenderloin
PRODUCT_DEVICE := tenderloin
