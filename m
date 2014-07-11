Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:44188 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753421AbaGKPfC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Jul 2014 11:35:02 -0400
Received: by mail-lb0-f181.google.com with SMTP id p9so1041910lbv.12
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Jul 2014 08:35:00 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Subject: [PATCH] kconfig/lxdialog: get ncurses CFLAGS with pkg-config
Date: Fri, 11 Jul 2014 17:34:54 +0200
Message-Id: <1405092894-21030-1-git-send-email-bjorn.forsman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: linux-kbuild@vger.kernel.org, =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>

check-lxdialog.sh has functions for finding ncurses linker and compiler
flags; ldflags() and ccflags().

ldflags() tries to get linker flags from pkg-config and has a fallback
if pkg-config fails. But ccflags() currently doesn't use pkg-config at
all, instead it does manual checks like this:

  if [ -f /usr/include/ncursesw/curses.h ]; then
      echo '-I/usr/include/ncursesw -DCURSES_LOC="<curses.h>"'
      echo ' -DNCURSES_WIDECHAR=1'
  elif [ -f /usr/include/ncurses/ncurses.h ]; then
      echo '-I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>"'
  [...]

This patch changes ccflags() so that it also tries pkg-config first, and
only if pkg-config fails does it go back to the fallback/manual checks.

This makes ldflags()/ccflags() symmetric (both try to use pkg-config
before falling back to manual checks) and has the nice side-effect of
making "make menuconfig" work on systems where ncurses is not installed
in a standard location (such as on NixOS).

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
2.0.1

