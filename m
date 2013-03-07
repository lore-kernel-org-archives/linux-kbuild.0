Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:37822 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932333Ab3CGSUu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Mar 2013 13:20:50 -0500
Received: by mail-wi0-f180.google.com with SMTP id hi8so496175wib.1
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Mar 2013 10:20:48 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 1/2] menuconfig: optionally use pkg-config to detect ncurses libs
Date: Thu,  7 Mar 2013 19:20:39 +0100
Message-Id: <fc9c6e000f62c2eeda426d4d5f022b3d57729bb0.1362679061.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1362679061.git.yann.morin.1998@free.fr>
References: <cover.1362679061.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1362679061.git.yann.morin.1998@free.fr>
References: <cover.1362679061.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org
Cc: Justin Lecher <jlec@gentoo.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>

From: Justin Lecher <jlec@gentoo.org>

When building ncurses with --with-termlib several symbols get moved from
libncurses.so to libtinfo.so. Thus when linking with libncurses.so, one
additionally needs to link with libtinfo.so.

The ncurses pkg-config module will be used to detect the necessary libs for
linking. If not available the old heuristic for detection of the ncurses libs
will be used.

Signed-off-by: Justin Lecher <jlec@gentoo.org>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/kconfig/lxdialog/check-lxdialog.sh |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
1.7.2.5

