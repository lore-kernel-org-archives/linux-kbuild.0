Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:35826 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751398AbbDYQFt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 25 Apr 2015 12:05:49 -0400
Date: Sat, 25 Apr 2015 16:05:46 +0000
From: sylvain.bertrand@gmail.com
Subject: [PATCH] kconfig: add tinfo library if it exists to lxdialog linking
 flags
Message-ID: <20150425160546.GA4002@freedom>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

HOSTLD  scripts/kconfig/mconf
/bin/ld: scripts/kconfig/lxdialog/checklist.o: undefined reference to symbol 'acs_map'

Add tinfo library to lxdiablog linking flags, if it exists.

Signed-off-by: Sylvain BERTRAND <sylvain.bertrand@gmail.com>
---
--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
+++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
@@ -4,6 +4,9 @@
 # What library to link
 ldflags()
 {
+	# Some ncurses symbols are in tinfo library, if it exists
+	pkg-config --libs tinfow 2>/dev/null
+	pkg-config --libs tinfo 2>/dev/null
 	pkg-config --libs ncursesw 2>/dev/null && exit
 	pkg-config --libs ncurses 2>/dev/null && exit
 	for ext in so a dll.a dylib ; do
