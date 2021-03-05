#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:8cea37366a0aec3045dc7009dee62ded5e116bb1; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:aaac8be1e5a1ef5da43aeb3af71649084bcf50f9 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:8cea37366a0aec3045dc7009dee62ded5e116bb1 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
