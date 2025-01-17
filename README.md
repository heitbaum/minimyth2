# MiniMyth2



## What it is
MiniMyth2 is dedicated firmware designed to turnaround small-factor ARMv7, ARMv8, i386 and x86_64 small-factor
computers into MythTV appliance offering fully functional MythTV frontend.

For platforms supporting PXE boot - MiniMyth2 offers disk-less, zero-effort provisioned, network booted MythTV frontend appliance.

From the software perspective, MiniMyth2 is MythTV frontend with minimal required run-time
(Linux kernel, GNU libraries, video/audio/IR remote drivers) allowing to run MythTV frontend with full speed & features
on recent hardware from Intel/AMD/Amlogic/Rockchip/Allwinner/Raspbery.



## Project Goals
Major goals of project are:

- Make MythTV frontend zero-effort setup/deployment.
Setup of MythTV frontend might be as simple as burning SD card or enabling PXE boot in frontend’s BIOS/EFI.

- Make graphics/sound/IR remote detection/configuration fully automatic.
No any drivers install nor configuration is required for any from 1500+ of graphic supported. The same for audio and IR remotes.

- Make easy adoption of recent FOSS achievements as base for creating zero-effort provisioned out-of-box ready to use
dedicated MythTV appliance.
Project is exploiting developments in GNU/Linux area like:
  - mainline Linux kernel support for Amlogic/Rockchip/Allwinner/Raspbery SoCs
  - Mesa3D Panfrost/Lima as FOSS support for ARM 3D IP
  - stateless/stateful V4L2 Video decode (Amlogic VDEC, Rockchip HANTRO/RKVDEC and Allwinner CEDRUS)
  - in-kernel IR remote decode for covering wide variety of supported IR remotes



## What it is not
MiniMyth2 is not just another Linux distro which is
designed to install on PC hardware and to used as computer
running various software.
Target scenario with MiniMyth2 is small, disk-less dedicated appliance
running MythTV Frontend (and preactically only MythTV Frontend).



## More Info
- MiniMyth2 [Changelog](https://raw.githubusercontent.com/warpme/minimyth2/master/html/minimyth/document-changelog.txt)
- Current version [Release Notes](https://raw.githubusercontent.com/warpme/minimyth2/master/html/minimyth/document-release-notes.txt)
- List of supported [Graphics HW](https://raw.githubusercontent.com/warpme/minimyth2/master/html/minimyth/document-supported-gfx-hardware.txt) (on x86_64 platforms)
- List of supported [IR receivers](https://raw.githubusercontent.com/warpme/minimyth2/master/html/minimyth/document-supported-IR-remotes.txt)



## More details: Wiki
MiniMyth2 [Wiki](https://github.com/warpme/minimyth2/wiki)



## Current Status

### General Functionality
This is general functionality avaliable on current code (Mainline Linux kernel)
SoC           | Tested on        | WiFi Chip & Support                     | CEC Support            | Sleep/Resume                   | Remarks                       |
------------- |------------------|-----------------------------------------|------------------------|--------------------------------|-------------------------------|
Allwinner H6  | EachLink H6 Mini | not works  (rtl8723bs@SDIO I/O issue)   | works                  | works                          | well supported                |
Allwinner H6  | TanixTX6-Mini    | not works  (xr819@SDIO firmware issue)  | works                  | works                          | well supported                |
Allwinner H6  | Beelink GS1      | not works  (fn-link6222@PCI-e no PCI-e) | works                  | not works (firmware issue)     | some things are still missing |
Rockchip 3328 | Beelink A1       | works  (rtl8821@USB)                    | works                  | currently power off/on         | good prospects                |
Rockchip 3399 | RockPI 4-b       | works  (ap6256@SDIO)                    | works                  | currently power off/on         | well supported                |
Amlogic s905  | TanixTX3-Mini    | not works  (sv6051@SDIO no driver aval) | not works (kernel bug) | not works (firmware issue)     | support stalled               |
Amlogic s912  | Beelink GT1      | works v.unreliably (qca9377@SDIO)       | not works (kernel bug) | not works (firmware issue)     | support stalled               |
Amlogic sm1   | x96Air           | works  (rtl8189@SDIO                    | not works (kernel bug) | not works (firmware issue)     | support stalled               |
Broadcom 2837 | Rpi3-b           | works  (brcm43430@SDIO)                 | works                  | no plans                       | all basics works nicelly      |
Broadcom 2711 | Rpi4-b           | works  (brcm4345@SDIO)                  | works                  | no plans                       | all basics works nicelly      |
Intel i5      | i5 NUC           | n/a                                     | n/a                    | works (s3ram)                  | perfect support               |
Intel Z8500   | Beelink MII-V    | works  (ac3165@PCI-e)                   | n/a                    | works (s1idle)                 | perfect support               |
Intel N3450   | Beelink BT4      | works  (ac3165@PCI-e)                   | n/a                    | not works (bios issue)         | perfect support, bootsplah nok|
AMD E1-2100   | AMD Kabini       | n/a                                     | n/a                    | works (s3ram)                  | perfect support               |
Intel D2550   | ION2             | n/a                                     | n/a                    | works (s3ram)                  | perfect support               |

### Hardware Video Decode support
This is video related functionality avaliable on current code (Linux kernel + Mesa + MythTV)
At this moment quality of playback is good for technology preview. 
On some platforms it is __not ready to daily usage__ as H.264 playback seek on v4l2_request platforms not works correctly yet.
Note: seek issue is only with H.264 v4l2_request. MPEG2/HEVC/VP8/VP9 seek works ok :-)
SoC           | Tested on                                    | Supported Decoder/ Hw.decode API      | Currently supported video decode HW.accel  | Supported drawing   | Supported video render | Remarks                                              |
------------- |----------------------------------------------|---------------------------------------|--------------------------------------------|---------------------|------------------------|------------------------------------------------------|
Allwinner H6  | EachLink H6 Mini, TanixTX6-Mini, Beelink GS1 | cedrus/v4l2_request                   | MPEG2, H.264, HEVC, VP8                    | X11, EGLFS, Wayland | EGL_DMABUF, DRM_DMABUF | Good playback, seek on v4l2_request H.264 not works
Rockchip 3328 | Beelink A1                                   | rkvdec/v4l2_request                   | MPEG2, H.264, HEVC, VP8, VP9               | X11, EGLFS, Wayland | EGL_DMABUF, DRM_DMABUF | Good playback, seek on v4l2_request H.264 not works
Rockchip 3399 | RockPI 4-b                                   | rkvdec/v4l2_request                   | MPEG2, H.264, HEVC, VP8, VP9               | X11, EGLFS, (1)     | EGL_DMABUF, DRM_DMABUF | Good playback, seek on v4l2_request H.264 not works, wyaland gives black.screen
Amlogic s905  | TanixTX3-Mini                                | vdec/v4l2_m2m                         | MPEG2, H.264, HEVC, VP9                    | X11, Wayland (2)    | EGL_DMABUF, DRM_DMABUF | Good playback, seek on v4l2_request H.264 not works, limited HEVC on s905w
Amlogic s912  | Beelink GT1                                  | vdec/v4l2_m2m                         | MPEG2, H.264, HEVC, VP9                    | X11, EGLFS, Wayland | EGL_DMABUF, DRM_DMABUF | Good playback, seek on v4l2_request H.264 not works
Amlogic sm1   | x96Air                                       | vdec/v4l2_m2m                         | MPEG2, H.264, HEVC, VP9                    | X11, EGLFS, Wayland | EGL_DMABUF, DRM_DMABUF | Good playback, seek on v4l2_request H.264 not works, artefacts on H.264
Broadcom 2837 | Rpi3-b                                       | rpi_dec/v4l2_m2m                      | H.264                                      | X11, EGLFS, Wayland | EGL_DMABUF, DRM_DMABUF | Good playback, seek on v4l2_m2m H.264 jumpy
Broadcom 2711 | Rpi4-b                                       | rpi_dec/v4l2_m2m, rpivid/v4l2_request | H.264, HEVC                                | X11, EGLFS, Wayland | EGL_DMABUF, DRM_DMABUF | Good playback, seek on v4l2_m2m H.264 jumpy
Intel i5      | i5 NUC                                       | VAAPI                                 | MPEG2, H.264, VC1                          | X11, EGLFS, Wayland | EGL_DMABUF (3)         | Perfect playback
Intel Z8500   | Beelink BT4                                  | VAAPI                                 | MPEG2, H.264, VC1, HVEC, VP8               | X11, EGLFS (4)      | EGL_DMABUF (3)         | Perfect playback
Intel N3450   | Beelink MII-V                                | VAAPI                                 | MPEG2, H.264, VC1, HVEC, VP8, VP9          | X11, EGLFS, Wayland | EGL_DMABUF (3)         | Perfect playback
AMD E1-2100   | AMD Kabini                                   | VAAPI                                 | MPEG2, H.264, VC1                          | X11, EGLFS, Wayland | EGL_DMABUF (3)         | Perfect playback
Intel D2550   | ION2                                         | VDPAU                                 | MPEG2, MPEG4, H.264                        | X11, (5)            | By GFx internally      | Perfect playback

(1) - Wayland gives black screen on this HW
(2) - EGLFS not works due z-position issue in messon-drm driver on this HW
(3) - DRM Planes fails with KMS Atomic Commit on this HW
(4) - mythfrontend segfaults in Wayland on this HW
(5) - EGLFS and Wayland not working on this HW as installed Nvidia BLOB is not providing EGL nor DRM

### Video Decoding Test results




# Tests

## Playback HW video decode tests on various HW.

This is summary of video samples tests conducted on current MiniMyth2 code: [Video test summary](https://github.com/warpme/minimyth2/blob/master/video-test-summary.txt)
