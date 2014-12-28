# inherit from the proprietary version
-include vendor/hp/tenderloin/BoardConfigVendor.mk

# Set true to use custom i.e. linaro, false to use prebuilts
USE_CUSTOM_TOOLCHAIN := false

# Allow SELinux to be disabled
ALLOW_DISABLE_SELINUX := true

TARGET_SPECIFIC_HEADER_PATH := device/hp/tenderloin/include

#art hacks
ART_USE_CUSTOM_NMSC := 32
ART_DONT_CHECK_GAP := true

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY_PATCH := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOOTLOADER_BOARD_NAME := tenderloin
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
BOARD_USES_ADRENO_200 := true

TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := scorpion
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=59 -DNEEDS_VECTORIMPL_SYMBOLS -DICS_CAMERA_BLOB

# use dosfsck from dosfstools
BOARD_USES_CUSTOM_FSCK_MSDOS := true

# Boot animation
TARGET_SCREEN_HEIGHT := 768
TARGET_SCREEN_WIDTH := 1024

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_ath6kl
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := ath6kl
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/ath6kl.ko"
WIFI_DRIVER_MODULE_NAME     := "ath6kl"
WIFI_DRIVER_LOADER_DELAY    := 1000000

# Audio
BOARD_USES_LEGACY_ALSA_AUDIO := true
#TARGET_QCOM_AUDIO_VARIANT := caf
COMMON_GLOBAL_CFLAGS += -DHTC_ACOUSTIC_AUDIO -DLEGACY_QCOM_VOICE
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_HCI := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/hp/tenderloin/bluetooth
BLUETOOTH_HCIATTACH_USING_PROPERTY = true

# Define egl.cfg location
BOARD_EGL_CFG := device/hp/tenderloin/configs/egl.cfg

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
#TARGET_QCOM_MEDIA_VARIANT := caf
#TARGET_QCOM_DISPLAY_VARIANT := caf

# QCOM HAL
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true

# enable three buffers at all times
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Use legacy MM heap behavior
TARGET_DISPLAY_INSECURE_MM_HEAP := true

# Use retire fence from MDP driver
TARGET_DISPLAY_USE_RETIRE_FENCE := true

# QCOM enhanced A/V
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# camera
USE_CAMERA_STUB := false
TARGET_DISABLE_ARM_PIE := true
BOARD_CAMERA_USE_GETBUFFERINFO := true
BOARD_FIRST_CAMERA_FRONT_FACING := true
BOARD_CAMERA_USE_ENCODEDATA := true
BOARD_USES_LEGACY_MMAP := true

# kernel settings
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40200000
BOARD_PAGE_SIZE := 2048

# uboot
BOARD_KERNEL_IMAGE_NAME := uImage
BOARD_USES_UBOOT_MULTIIMAGE := true
BOARD_CUSTOM_BOOTIMG_MK := device/hp/tenderloin/releasetools/uboot-bootimg.mk
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := device/hp/tenderloin/releasetools/tenderloin_img_from_target_files
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/hp/tenderloin/releasetools/tenderloin_ota_from_target_files
TARGET_RELEASETOOL_MAKE_RECOVERY_PATCH_SCRIPT := device/hp/tenderloin/releasetools/tenderloin_make_recovery_patch

# Define kernel config for inline building
TARGET_KERNEL_CONFIG := cyanogenmod_tenderloin_defconfig
TARGET_KERNEL_SOURCE := kernel/hp/tenderloin

ifeq ($(USE_CUSTOM_TOOLCHAIN),true)
  BOARD_USES_LIBQC_OPT := true
  TARGET_KERNEL_CUSTOM_TOOLCHAIN := android-toolchain-eabi
endif

KERNEL_WIFI_MODULES:
	$(MAKE) -C external/backports-wireless defconfig-ath6kl
	export CROSS_COMPILE=$(ARM_EABI_TOOLCHAIN)/arm-eabi-; $(MAKE) -C external/backports-wireless KLIB=$(KERNEL_SRC) KLIB_BUILD=$(KERNEL_OUT) ARCH=$(TARGET_ARCH) $(ARM_CROSS_COMPILE)
	cp `find external/backports-wireless -name *.ko` $(KERNEL_MODULES_OUT)/
	arm-eabi-strip --strip-debug `find $(KERNEL_MODULES_OUT) -name *.ko`
	$(MAKE) -C external/backports-wireless clean

TARGET_KERNEL_MODULES := KERNEL_WIFI_MODULES

TARGET_RECOVERY_DEVICE_DIRS += device/hp/tenderloin
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/hp/tenderloin/recovery/recovery_keys.c
BOARD_CUSTOM_GRAPHICS:= ../../../device/hp/tenderloin/recovery/graphics.c
RECOVERY_FSTAB_VERSION=2
TARGET_RECOVERY_FSTAB = device/hp/tenderloin/recovery/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true

# partition sizes
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838860800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 20044333056
BOARD_FLASH_BLOCK_SIZE := 131072

# device specific settings menu
BOARD_HARDWARE_CLASS := device/hp/tenderloin/cmhw/

# Multiboot stuff
TARGET_RECOVERY_PRE_COMMAND := "/system/bin/rebootcmd"
TARGET_RECOVERY_PRE_COMMAND_CLEAR_REASON := true
