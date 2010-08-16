Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:63818 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751627Ab0HPE2t (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 00:28:49 -0400
Received: by mail-gx0-f174.google.com with SMTP id 23so1750426gxk.19
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Aug 2010 21:28:49 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 2/4] kbuild: don't include `check-lxdialog' ldflags in global HOST_LOADLIBES
Date: Mon, 16 Aug 2010 00:19:04 -0400
Message-Id: <1281932346-19067-2-git-send-email-lacombar@gmail.com>
In-Reply-To: <1281932346-19067-1-git-send-email-lacombar@gmail.com>
References: <1281932346-19067-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

On BSD systems, `check-lxdialog' would select -lcurses as the default
curses library which would conflict with -lncurses at runtime: curses'
compatible symbols are getting handled by the system's curses library while the
ncurses-specific symbols are getting handled by the ports' ncurses.

This fixes `nconf' segmentation fault on these systems.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/Makefile |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index de934de..7522a8b 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -146,7 +146,6 @@ check-lxdialog  := $(srctree)/$(src)/lxdialog/check-lxdialog.sh
 # Use recursively expanded variables so we do not call gcc unless
 # we really need to do so. (Do not call gcc as part of make mrproper)
 HOST_EXTRACFLAGS = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags)
-HOST_LOADLIBES   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
 
 HOST_EXTRACFLAGS += -DLOCALE
 
@@ -208,7 +207,7 @@ clean-files     += config.pot linux.pot
 PHONY += $(obj)/dochecklxdialog
 $(addprefix $(obj)/,$(lxdialog)): $(obj)/dochecklxdialog
 $(obj)/dochecklxdialog:
-	$(Q)$(CONFIG_SHELL) $(check-lxdialog) -check $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOST_LOADLIBES)
+	$(Q)$(CONFIG_SHELL) $(check-lxdialog) -check $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTLOADLIBES_mconf)
 
 always := dochecklxdialog
 
@@ -226,6 +225,8 @@ HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-2.0 gmodule-2.0 libglade-2.0` -ldl
 HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
                           -D LKC_DIRECT_LINK
 
+HOSTLOADLIBES_mconf   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
+
 HOSTLOADLIBES_nconf	= -lmenu -lpanel -lncurses
 $(obj)/qconf.o: $(obj)/.tmp_qtcheck
 
-- 
1.7.2.30.gc37d7.dirty

