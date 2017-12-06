LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# ---------------------------------------------------------------------------------
#            Common definitons
# ---------------------------------------------------------------------------------
LOCAL_SRC_FILES :=                       \
        DashPlayer.cpp                  \
        DashPlayerDriver.cpp            \
        DashPlayerRenderer.cpp          \
        DashPlayerStats.cpp             \
        DashPlayerDecoder.cpp           \
        DashPacketSource.cpp            \
        DashFactory.cpp

LOCAL_SHARED_LIBRARIES :=       \
    libbinder                   \
    libcamera_client            \
    libcutils                   \
    libdl                       \
    libgui                      \
    libmedia                    \
    libstagefright              \
    libstagefright_foundation   \
    libstagefright_omx          \
    libutils                    \
    libui                       \
    libOmxCore					\
    libmemalloc

LOCAL_C_INCLUDES := \
    $(TOP)/frameworks/av/media/libstagefright/timedtext           \
	$(TOP)/frameworks/native/include/media/hardware               \
	$(TOP)/frameworks/native/include/media/openmax                \
	$(TOP)/frameworks/av/media/libstagefright/httplive            \
	$(TOP)/frameworks/av/media/libmediaplayerservice/nuplayer     \
	$(TOP)/frameworks/av/media/libmediaplayerservice              \
	$(TOP)/frameworks/av/media/libstagefright/include             \
	$(TOP)/frameworks/av/media/libstagefright/mpeg2ts             \
	$(TOP)/frameworks/av/media/libstagefright/rtsp                \
	$(TOP)/hardware/qcom/media/mm-core/inc                        \
	$(TOP)/hardware/qcom/display/libgralloc                       \
    $(LOCAL_PATH)/..                                              \
	$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include			  \
	$(TARGET_OUT)/../obj/include/mm-core/omxcore				  \
	$(TARGET_OUT)/../obj/include/qcom/display

LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

ifeq ($(PLATFORM_SDK_VERSION), 18)
  LOCAL_CFLAGS += -DANDROID_JB_MR2
endif

LOCAL_CFLAGS += -DBFAMILY_TARGET

LOCAL_MODULE:= libdashplayer

LOCAL_MODULE_TAGS := optional

ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
 include $(BUILD_SHARED_LIBRARY)
endif
