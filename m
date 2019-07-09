Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.riseup.net ([198.252.153.129]:46900 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726679AbfGIJ6G (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 05:58:06 -0400
From: =?UTF-8?Q?Joonas_Kylm=c3=a4l=c3=a4?= <joonas.kylmala@iki.fi>
Subject: Issue/Bug report: auto.conf not generated correctly when
 CROSS_COMPILE environment var set
Message-ID: <ed43c836-bbb2-9283-67ce-4b59563ac327@iki.fi>
Date: Tue, 9 Jul 2019 12:57:57 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>

Hi Masahiro and Michal,

I'm having a build issue regarding auto.conf generation with the the
latest master (commit 5ad18b2e60b7) plus this patch to use
CONFIG_USB_FUNCTIONFS as built-in module:

diff --git a/arch/arm/configs/imx_v6_v7_defconfig
b/arch/arm/configs/imx_v6_v7_defconfig
index 8116648a8efd..228098c64c48 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -345,14 +345,7 @@ CONFIG_USB_CONFIGFS_F_MIDI=y
 CONFIG_USB_CONFIGFS_F_HID=y
 CONFIG_USB_CONFIGFS_F_UVC=y
 CONFIG_USB_CONFIGFS_F_PRINTER=y
-CONFIG_USB_ZERO=m
-CONFIG_USB_AUDIO=m
-CONFIG_USB_ETH=m
-CONFIG_USB_G_NCM=m
-CONFIG_USB_GADGETFS=m
-CONFIG_USB_FUNCTIONFS=m
-CONFIG_USB_MASS_STORAGE=m
-CONFIG_USB_G_SERIAL=m
+CONFIG_USB_FUNCTIONFS=y
 CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y

Here is a excerpt from my terminal so you can understand and reproduce
the bug/issue easily:

user@builder:~/linux$ export CROSS_COMPILE=arm-none-eabi-
user@builder:~/linux$ export ARCH=arm
user@builder:~/linux$ make mrproper && make clean && make
imx_v6_v7_defconfig && rgrep USB_FUNCTIONFS | grep "auto.conf"
  CLEAN   scripts/basic
  CLEAN   scripts/kconfig
  CLEAN   include/config include/generated
  CLEAN   .config
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.h
  HOSTCC  scripts/kconfig/lexer.lex.o
  YACC    scripts/kconfig/parser.tab.c
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
user@builder:~/linux$ make mrproper && make clean && make
imx_v6_v7_defconfig && make syncconfig && rgrep USB_FUNCTIONFS | grep
"auto.conf"
  CLEAN   scripts/basic
  CLEAN   scripts/kconfig
  CLEAN   include/config include/generated
  CLEAN   .config
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.h
  HOSTCC  scripts/kconfig/lexer.lex.o
  YACC    scripts/kconfig/parser.tab.c
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
scripts/kconfig/conf  --syncconfig Kconfig
include/config/auto.conf:CONFIG_USB_FUNCTIONFS=y
include/config/auto.conf:CONFIG_USB_FUNCTIONFS_GENERIC=y

As we can see in the first build command run CONFIG_USB_FUNCTIONFS=y
doesn't appear in the file include/config/auto.conf, it only appears
after running "make syncconfig". Normally this is not a problem for me
since for "make *_defconfig" I don't use CROSS_COMPILE in that step and
I only use it in "make zImage". If I run "CROSS_COMPILE=xxxx make
zImage" then I think syncconfig is triggered because in the "make
*_defconfig" stage the compiler was different [1] and so I don't hit
this issue with auto.conf not being generated correctly.

Anyways, some projects like LineageOS set the CROSS_COMPILE variable
even for "make *_defconfig" command (for reproducibility reasons I
guess) so this issue exists there. And it is quite handy to just put to
your shell profile "export CROSS_COMPILE=xxx" so one doesn't need to
type it always.

I'm using Debian 9 for compilation so I think the version of
arm-none-eabi-gcc is 5.4.1 (debian package version
15:5.4.1+svn241155-1). As I understood, Denis (in CC) was able to
reproduce this in Trisquel 8 with similar commands but slightly older
kernel version 5.2rc7 plus some additional patches.

[1] https://patchwork.kernel.org/patch/10507817/

-Joonas
