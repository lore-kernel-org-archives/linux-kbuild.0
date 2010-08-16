Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:52731 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751627Ab0HPE2v (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 00:28:51 -0400
Received: by ywh1 with SMTP id 1so1735284ywh.19
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Aug 2010 21:28:50 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 3/4] kbuild: `nconf' needs -lintl
Date: Mon, 16 Aug 2010 00:19:05 -0400
Message-Id: <1281932346-19067-3-git-send-email-lacombar@gmail.com>
In-Reply-To: <1281932346-19067-1-git-send-email-lacombar@gmail.com>
References: <1281932346-19067-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 7522a8b..7d129f0 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -227,7 +227,7 @@ HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
 
 HOSTLOADLIBES_mconf   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
 
-HOSTLOADLIBES_nconf	= -lmenu -lpanel -lncurses
+HOSTLOADLIBES_nconf	= -lmenu -lpanel -lncurses -lintl
 $(obj)/qconf.o: $(obj)/.tmp_qtcheck
 
 ifeq ($(qconf-target),1)
-- 
1.7.2.30.gc37d7.dirty

