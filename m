Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:50689 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752477AbaINK6s (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 14 Sep 2014 06:58:48 -0400
Received: by mail-lb0-f176.google.com with SMTP id z11so3030614lbi.7
        for <linux-kbuild@vger.kernel.org>; Sun, 14 Sep 2014 03:58:46 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Subject: [PATCH] kconfig/lxdialog: get ncurses CFLAGS with pkg-config
Date: Sun, 14 Sep 2014 12:57:50 +0200
Message-Id: <1410692270-3225-1-git-send-email-bjorn.forsman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: linux-kbuild@vger.kernel.org, =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>

This makes "make menuconfig" also work on systems where ncurses is not
installed in a standard location (such as on NixOS).

This patch changes ccflags() so that it tries pkg-config first, and only
if pkg-config fails does it go back to the fallback/manual checks. This
is the same algorithm that ldflags() already uses.

Signed-off-by: Bjørn Forsman <bjorn.forsman@gmail.com>
---
 scripts/kconfig/lxdialog/check-lxdialog.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
index 9d2a4c5..5075ebf 100644
--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
+++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
@@ -21,7 +21,11 @@ ldflags()
 # Where is ncurses.h?
 ccflags()
 {
-	if [ -f /usr/include/ncursesw/curses.h ]; then
+	if pkg-config --cflags ncursesw 2>/dev/null; then
+		echo '-DCURSES_LOC="<ncurses.h>" -DNCURSES_WIDECHAR=1'
+	elif pkg-config --cflags ncurses 2>/dev/null; then
+		echo '-DCURSES_LOC="<ncurses.h>"'
+	elif [ -f /usr/include/ncursesw/curses.h ]; then
 		echo '-I/usr/include/ncursesw -DCURSES_LOC="<curses.h>"'
 		echo ' -DNCURSES_WIDECHAR=1'
 	elif [ -f /usr/include/ncurses/ncurses.h ]; then
-- 
2.1.0

