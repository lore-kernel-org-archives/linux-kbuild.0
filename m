Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:43460 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751997Ab2FMANj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 Jun 2012 20:13:39 -0400
Received: by vcbf11 with SMTP id f11so2206vcb.19
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jun 2012 17:13:38 -0700 (PDT)
From: "Yaakov (Cygwin/X)" <yselkowitz@users.sourceforge.net>
Subject: [PATCH] kconfig: fix check-lxdialog for DLL platforms
Date: Tue, 12 Jun 2012 19:05:15 -0500
Message-Id: <1339545915-8892-1-git-send-email-yselkowitz@users.sourceforge.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

From: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>

Import libraries on Cygwin and MinGW/MSYS use the .dll.a suffix, so
checking this suffix is necessary to make sure ncurses will still be
found when built without static libraries.

Signed-off-by: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>
---
Also applies to all 3.x stable branches

 scripts/kconfig/lxdialog/check-lxdialog.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
index b75820b..e3b12c0 100644
--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
+++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
@@ -4,7 +4,7 @@
 # What library to link
 ldflags()
 {
-	for ext in so a dylib ; do
+	for ext in so a dll.a dylib ; do
 		for lib in ncursesw ncurses curses ; do
 			$cc -print-file-name=lib${lib}.${ext} | grep -q /
 			if [ $? -eq 0 ]; then
-- 
1.7.9

