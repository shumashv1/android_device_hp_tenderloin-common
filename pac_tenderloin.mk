# Release name
PRODUCT_RELEASE_NAME := TouchPad

# Inherit some PAC config.
$(call inherit-product, vendor/pac/config/common_full_tablet_wifionly.mk)

# PAC bootanimation
PAC_BOOTANIMATION_NAME := 768

# Inherit device configuration
$(call inherit-product, device/hp/tenderloin/full_tenderloin.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := pac_tenderloin
PRODUCT_DEVICE := tenderloin
PRODUCT_BRAND := HP
PRODUCT_MODEL := TouchPad
PRODUCT_MANUFACTURER := HP

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=touchpad BUILD_FINGERPRINT=hp/hp_tenderloin/tenderloin:6.0/MRA58K/2256973:user/release-keys PRIVATE_BUILD_DESC="tenderloin-user 6.0/MRA58K/2256973 release-keys"
