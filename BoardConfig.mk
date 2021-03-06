LOCAL_PATH := device/Alcatel/popC2

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a7
TARGET_CPU_VARIANT:= cortex-a7

# Partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 545259520
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2214068224
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false


TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel

BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_MKBOOTIMG_ARGS := --base 0x10000000 --pagesize 2048 --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --mtk 1    

BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_MKBOOTIMG := mtkbootimg
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/bootimg.mk

TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/gadget/lun%d/file
DEVICE_SCREEN_WIDTH := 480
DEVICE_SCREEN_HEIGHT := 800
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness

RECOVERY_VARIANT := carliv

ifneq ($(RECOVERY_VARIANT),twrp)
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/recovery.fstab
endif

# CARLIV
ifeq ($(RECOVERY_VARIANT),carliv)
VIBRATOR_TIMEOUT_FILE := /sys/devices/virtual/timed_output/vibrator/enable
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_10x18.h\"
DEVICE_RESOLUTION := 480x800
BOARD_HAS_MTK_CPU := true
BOARD_NEEDS_MTK_GETSIZE := true
endif
# TWRP
ifeq ($(RECOVERY_VARIANT),twrp)
#MTK common twrp flags
TW_NO_EXFAT := true
TWHAVE_SELINUX := true
TW_DISABLE_TTF := false
#TW_USE_TOOLBOX := true
TW_NO_EXFAT_FUSE := true
TW_THEME := portrait_mdpi
#RECOVERY_SDCARD_ON_DATA := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
endif
