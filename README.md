# OrangeFox Device Tree for Xiaomi lmi (POCO F2 Pro / Redmi K30 Pro / Redmi K30 Pro Zoom Edition)

## Device specs
|     Item | Value |
|----------|-------|
SoC          | Snapdragon 865 (SM8250 / Kona)
CPU           | 8 cores (1 x Kryo 585 Prime (A77): 2.84 GHz 3 x Kryo 585 Gold (A77): 2.42 GHz 4 x Kryo 585 Silver (A55): 1.8 GHz) 
RAM           | 6/8/12GB LPDDR4X/LPDDR5
Storage    | 128/256/512 GB UFS 3.0/UFS 3.1
Battery    | Li-Po 4700mAh
Display    | 2400x1080 60Hz 6.67in OLED
Dimensions | 163.3x75.4x8.9mm
Kernel     | 4.19 
A/B        | A-only

## Build

### Clone & Sync Source
```
mkdir ~/OrangeFox_sync
cd ~/OrangeFox_sync
git clone https://gitlab.com/OrangeFox/sync.git
cd ~/OrangeFox_sync/sync
./orangefox_sync.sh --branch 12.1 --path ~/fox_12.1
```
### Clone Device-tree
```
cd ~/fox_12.1/device
mkdir -p xiaomi
cd xiaomi
git clone https://github.com/wenjie2333/orangefox_device_xiaomi_lmi.git lmi
```
### BUILD!
```
cd ~/fox_12.1
source build/envsetup.sh
lunch twrp_lmi-eng
mka recoveryimage
