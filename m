Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.data-modul.de ([212.184.205.171]:38039 "HELO
	mailgw1.data-modul.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751057AbaHRLFa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Aug 2014 07:05:30 -0400
From: Silvio Fricke <silvio.fricke@gmail.com>
Subject: [PATCH v2] kconfig: menuconfig: pkg-config should base upon default configuration
Date: Mon, 18 Aug 2014 13:05:10 +0200
Message-Id: <1408359910-17394-2-git-send-email-silvio.fricke@gmail.com>
In-Reply-To: <1408359910-17394-1-git-send-email-silvio.fricke@gmail.com>
References: <1408359910-17394-1-git-send-email-silvio.fricke@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E . MORIN" <yann.morin.1998@free.fr>
Cc: Silvio Fricke <silvio.fricke@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Since fc9c6e0 "menuconfig: optionally use pkg-config to detect ncurses
libs" we use pkg-config, but some cross toolchains (like yocto tc)
change the search pathes for pc files with some PKG_CONFIG_* environment
variables.

With this patch we ensure that we only get the host config options for
ncurses and don't mix with others not relevant settings.

Signed-off-by: Silvio Fricke <silvio.fricke@gmail.com>
---
 scripts/kconfig/lxdialog/check-lxdialog.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
index 9d2a4c5..a067d3c 100644
--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
+++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
@@ -1,6 +1,9 @@
 #!/bin/sh
 # Check ncurses compatibility
 
+unset PKG_CONFIG_PATH
+unset PKG_CONFIG_SYSROOT_DIR
+
 # What library to link
 ldflags()
 {
-- 
2.0.4

