#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:956ef796631ba1a4f927c1115ad7912474d877f0; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:122cb7348eb1f51ddfb647b9fae9ed78bb4850ce \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:956ef796631ba1a4f927c1115ad7912474d877f0 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
