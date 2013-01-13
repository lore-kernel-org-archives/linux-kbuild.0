Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:34955 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753970Ab3AMCdI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Jan 2013 21:33:08 -0500
From: Tiana Rakotovao Andriamahefa <rkmahefa@gmail.com>
Subject: [PATCH] scripts: kconfig: qconf.cc: fix a compiliation error when using make xconfig
Date: Sun, 13 Jan 2013 03:28:40 +0000
Message-Id: <1358047720-10358-1-git-send-email-rkmahefa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Tiana Rakotovao Andriamahefa <rkmahefa@gmail.com>

When using make xconfig, the following compilation error appears :
   /usr/include/qt3/qvaluelist.h:427:13: error: ‘ptrdiff_t’ does not name a type
Including stddef.h in scripts/kconfig/qconf.cc permits to avoid this error.

Signed-off-by: Tiana Rakotovao Andriamahefa <rkmahefa@gmail.com>
---
 scripts/kconfig/qconf.cc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index df274fe..1500c38 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -6,6 +6,7 @@
 #include <qglobal.h>
 
 #if QT_VERSION < 0x040000
+#include <stddef.h>
 #include <qmainwindow.h>
 #include <qvbox.h>
 #include <qvaluelist.h>
-- 
1.7.10.4

