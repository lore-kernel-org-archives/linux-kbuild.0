Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.not-your-server.de ([78.46.182.243]:46093 "EHLO
	mail.not-your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753362Ab3CFNCH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Mar 2013 08:02:07 -0500
From: jlec@gentoo.org
Subject: [PATCH 1/2] menuconfig: optionally use pkg-config to detect ncurses libs
Date: Wed,  6 Mar 2013 14:02:01 +0100
Message-Id: <1362574922-4799-2-git-send-email-jlec@gentoo.org>
In-Reply-To: <1362574922-4799-1-git-send-email-jlec@gentoo.org>
References: <Use config scripts to detect ncurses libs for, menuconfig/nconfig dialogs>
 <1362574922-4799-1-git-send-email-jlec@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Justin Lecher <jlec@gentoo.org>

From: Justin Lecher <jlec@gentoo.org>

When building ncurses with --with-termlib several symbols get moved from
libncurses.so to libtinfo.so. Thus when linking with libncurses.so, one
additionally needs to link with libtinfo.so.

The ncurses pkg-config module will be used to detect the necessary libs for
linking. If not available the old heuristic for detection of the ncurses libs
will be used.

Signed-off-by: Justin Lecher <jlec@gentoo.org>
---
 scripts/kconfig/lxdialog/check-lxdialog.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
index 8078813..782d200 100644
--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
+++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
@@ -4,6 +4,8 @@
 # What library to link
 ldflags()
 {
+	pkg-config --libs ncursesw 2>/dev/null && exit
+	pkg-config --libs ncurses 2>/dev/null && exit
 	for ext in so a dll.a dylib ; do
 		for lib in ncursesw ncurses curses ; do
 			$cc -print-file-name=lib${lib}.${ext} | grep -q /
-- 
1.8.1.5

