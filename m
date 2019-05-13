Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:39677 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbfEMGW3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 May 2019 02:22:29 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/4] media: remove unneeded header search paths
Date: Mon, 13 May 2019 15:22:14 +0900
Message-Id: <20190513062217.20750-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190513062217.20750-1-yamada.masahiro@socionext.com>
References: <20190513062217.20750-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org

I was able to build without these extra header search paths.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I split this kind of cleanups per-subsystem,
and all of them were merged, except the media subsystem.

I sent ping several times to the media subsystem
but I could not get response at all.
https://lkml.org/lkml/2019/4/11/1040

It is almost 4 months since the submission.
Meanwhile, I asked 0day bot to test this, and I did not
get any problem report.
I am going to apply this to kbuild tree
since this is a prerequisite for the Kbuild core change.


 drivers/media/dvb-frontends/cxd2880/Makefile  | 2 --
 drivers/media/pci/bt8xx/Makefile              | 1 -
 drivers/media/platform/sti/c8sectpfe/Makefile | 1 -
 drivers/media/radio/Makefile                  | 2 --
 drivers/media/spi/Makefile                    | 2 --
 drivers/media/usb/cx231xx/Makefile            | 1 -
 drivers/media/usb/usbvision/Makefile          | 2 --
 7 files changed, 11 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2880/Makefile b/drivers/media/dvb-frontends/cxd2880/Makefile
index c6baa4caba19..646598b556d5 100644
--- a/drivers/media/dvb-frontends/cxd2880/Makefile
+++ b/drivers/media/dvb-frontends/cxd2880/Makefile
@@ -14,5 +14,3 @@ cxd2880-objs := cxd2880_common.o \
 		cxd2880_top.o
 
 obj-$(CONFIG_DVB_CXD2880) += cxd2880.o
-
-ccflags-y += -Idrivers/media/dvb-frontends
diff --git a/drivers/media/pci/bt8xx/Makefile b/drivers/media/pci/bt8xx/Makefile
index 7f1c3beb1bbc..0b5032c8a9c0 100644
--- a/drivers/media/pci/bt8xx/Makefile
+++ b/drivers/media/pci/bt8xx/Makefile
@@ -7,5 +7,4 @@ obj-$(CONFIG_VIDEO_BT848) += bttv.o
 obj-$(CONFIG_DVB_BT8XX) += bt878.o dvb-bt8xx.o dst.o dst_ca.o
 
 ccflags-y += -Idrivers/media/dvb-frontends
-ccflags-y += -Idrivers/media/common
 ccflags-y += -Idrivers/media/tuners
diff --git a/drivers/media/platform/sti/c8sectpfe/Makefile b/drivers/media/platform/sti/c8sectpfe/Makefile
index 34d69472b6f0..4bf0c6bf20e1 100644
--- a/drivers/media/platform/sti/c8sectpfe/Makefile
+++ b/drivers/media/platform/sti/c8sectpfe/Makefile
@@ -4,6 +4,5 @@ c8sectpfe-y += c8sectpfe-core.o c8sectpfe-common.o c8sectpfe-dvb.o \
 
 obj-$(CONFIG_DVB_C8SECTPFE) += c8sectpfe.o
 
-ccflags-y += -Idrivers/media/common
 ccflags-y += -Idrivers/media/dvb-frontends/
 ccflags-y += -Idrivers/media/tuners/
diff --git a/drivers/media/radio/Makefile b/drivers/media/radio/Makefile
index 37e6e8255b57..53c7ae135460 100644
--- a/drivers/media/radio/Makefile
+++ b/drivers/media/radio/Makefile
@@ -36,5 +36,3 @@ obj-$(CONFIG_RADIO_TEA575X) += tea575x.o
 obj-$(CONFIG_USB_RAREMONO) += radio-raremono.o
 
 shark2-objs := radio-shark2.o radio-tea5777.o
-
-ccflags-y += -Isound
diff --git a/drivers/media/spi/Makefile b/drivers/media/spi/Makefile
index 9e536777a330..c254e2a70ec5 100644
--- a/drivers/media/spi/Makefile
+++ b/drivers/media/spi/Makefile
@@ -1,6 +1,4 @@
 obj-$(CONFIG_VIDEO_GS1662) += gs1662.o
 obj-$(CONFIG_CXD2880_SPI_DRV) += cxd2880-spi.o
 
-ccflags-y += -Idrivers/media/dvb-core
-ccflags-y += -Idrivers/media/dvb-frontends
 ccflags-y += -Idrivers/media/dvb-frontends/cxd2880
diff --git a/drivers/media/usb/cx231xx/Makefile b/drivers/media/usb/cx231xx/Makefile
index c023d97407de..af824fd80366 100644
--- a/drivers/media/usb/cx231xx/Makefile
+++ b/drivers/media/usb/cx231xx/Makefile
@@ -11,4 +11,3 @@ obj-$(CONFIG_VIDEO_CX231XX_DVB) += cx231xx-dvb.o
 
 ccflags-y += -Idrivers/media/tuners
 ccflags-y += -Idrivers/media/dvb-frontends
-ccflags-y += -Idrivers/media/usb/dvb-usb
diff --git a/drivers/media/usb/usbvision/Makefile b/drivers/media/usb/usbvision/Makefile
index 494d030b4979..e8e5eda08b6f 100644
--- a/drivers/media/usb/usbvision/Makefile
+++ b/drivers/media/usb/usbvision/Makefile
@@ -1,5 +1,3 @@
 usbvision-objs  := usbvision-core.o usbvision-video.o usbvision-i2c.o usbvision-cards.o
 
 obj-$(CONFIG_VIDEO_USBVISION) += usbvision.o
-
-ccflags-y += -Idrivers/media/tuners
-- 
2.17.1
