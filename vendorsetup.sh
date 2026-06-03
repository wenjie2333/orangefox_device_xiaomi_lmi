#
#	此文件是OrangeFox恢复项目的一部分
# 	Copyright (C) 2021 The OrangeFox Recovery Project
#
#	OrangeFox是自由软件：您可以重新分发和/或修改它
#	前提是遵守由自由软件基金会发布的GNU通用公共许可证，
#	无论是许可证的第3版，还是（根据您的选择）任何后续版本。
#
#	OrangeFox的发布基于其可能有用这一前提，
#	但**不提供任何担保**；甚至不包含对**适销性**或**特定用途适用性**的默示担保。
#	详情请参阅GNU通用公共许可证。
#
# 	本软件根据GPL第3版或任何后续版本发布。
#	参见<http://www.gnu.org/licenses/>。
#
# 	如果您使用此脚本或其任何部分，请保留此声明
#
# 设备代号，指定当前构建的目标设备
FDEVICE="lmi"
#set -o xtrace

# 设备识别函数，检查当前构建环境是否针对指定设备
fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then 
   # 基础设置
   	export TW_DEFAULT_LANGUAGE="zh_CN" # 默认语言设置为中文
	export LC_ALL="C" # 统一字符编码，避免中文乱码
 	export ALLOW_MISSING_DEPENDENCIES=true # 允许缺少依赖项
	export OF_USE_GREEN_LED=0 # 禁用绿灯
	#export OF_FBE_METADATA_MOUNT_IGNORE=1 # 忽略FBE元数据挂载
	#export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1 # 使用TWRP恢复镜像构建器
	export OF_MANUAL_COPY_TWRES=1 # 手动复制TWRES文件
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1 # 禁用Treble兼容性检查
	export OF_NO_MIUI_PATCH_WARNING=1 # 禁用MIUI补丁警告
	export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1 # 跳过多用户文件夹备份
	export OF_QUICK_BACKUP_LIST="/boot;/dtbo;" # 快速备份列表
	
	#功能开关配置
	export FOX_ASH_IS_BASH=1 # 将Ash Shell设置为Bash Shell
	export FOX_USE_BASH_SHELL=1 # 使用Bash Shell
	export FOX_USE_TAR_BINARY=1 # 使用Tar二进制文件
	export FOX_USE_SED_BINARY=1 # 使用Sed二进制文件
	export FOX_USE_ZSTD_BINARY=1  # 启用zstd命令支持
	export FOX_USE_DATE_BINARY=1  # 启用date命令支持
	export FOX_USE_XZ_UTILS=1 # 使用XZ工具
	export FOX_REPLACE_TOOLBOX_GETPROP=1  # 使用完整的getprop命令
	export FOX_ENABLE_APP_MANAGER=1  # 启用应用管理器
	
	#设备相关配置
	export TARGET_DEVICE_ALT="lmi" # 设备代号
	export FOX_TARGET_DEVICES="lmi,lmipro" # 支持的代号列表
	export OF_FORCE_DATA_FORMAT_F2FS=1 # 强制数据分区使用F2FS格式
	export OF_UNBIND_SDCARD_F2FS=1 # 在F2FS格式化时解绑SD卡

	# OTA
	export OF_KEEP_DM_VERITY=1 # 保持DM-Verity
	export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1 # 支持所有块OTA更新
	export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1 # 修复OTA更新手动刷机错误
	export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1 # 默认禁用MIUI OTA

	# 界面与时区设置
	export OF_SCREEN_H=2400 # 屏幕高度
	export OF_STATUS_H=110 # 状态栏高度
	export OF_STATUS_INDENT_LEFT=48 # 状态栏左侧缩进
	export OF_STATUS_INDENT_RIGHT=48 # 状态栏右侧缩进
	export OF_HIDE_NOTCH=0 # 是否隐藏刘海
	export OF_ALLOW_DISABLE_NAVBAR=0 # 是否允许禁用导航栏
	export OF_DEFAULT_TIMEZONE="UTC-8" # 默认时区设置为中国标准时间
	
	# 特殊设置
	export OF_MAINTAINER="wenjie233" # 维护者名称
	export FOX_BUILD_TYPE="Unofficial" # 构建类型：官方/非官方
	export OF_ENABLE_ALL_PARTITION_TOOLS=1 # 启用所有分区工具
	export FOX_DELETE_AROMAFM=1 # 删除Aroma文件管理器

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
#
