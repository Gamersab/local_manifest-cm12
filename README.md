CyanogenMod 12
==============

The local manifests for building CM12 for HTC Explorer/Pico.

To sync:

    repo init -u git://github.com/CyanogenMod/android.git -b cm-12.0
    curl --create-dirs -L -o .repo/local_manifests/local_manifest.xml -O -L https://raw.githubusercontent.com/Gamersab/local_manifest-cm12/master/local_manifest.xml
    repo sync
    sh vendor/cm/get-prebuilts
    cd frameworks/av
    git fetch https://github.com/gamersab/android_frameworks_av && git cherry-pick e2236075e24006fd39823f073a36ea0aed226dbd
    source build/envsetup.sh
    brunch pico -jx* ( x refers number of threads ur cpu can handle)

