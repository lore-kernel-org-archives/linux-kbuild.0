Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:54589 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932333Ab3CGSUv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Mar 2013 13:20:51 -0500
Received: by mail-wg0-f48.google.com with SMTP id 16so1378698wgi.3
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Mar 2013 10:20:50 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 2/2] kconfig: optionally use pkg-config to detect ncurses libs
Date: Thu,  7 Mar 2013 19:20:40 +0100
Message-Id: <544e7e548fbe75cb93784cc02fc01ce1501286b6.1362679061.git.yann.morin.1998@free.fr>
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
linking. If not available the old way of directly specifying libs will be
used.

Signed-off-by: Justin Lecher <jlec@gentoo.org>
[yann.morin.1998@free.fr: fix typo: '-ncurses' --> '-lncurses']
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/kconfig/Makefile |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 231b475..844bc9d 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -219,7 +219,9 @@ HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
 
 HOSTLOADLIBES_mconf   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
 
-HOSTLOADLIBES_nconf	= -lmenu -lpanel -lncurses
+HOSTLOADLIBES_nconf	= $(shell \
+				pkg-config --libs menu panel ncurses 2>/dev/null \
+				|| echo "-lmenu -lpanel -lncurses"  )
 $(obj)/qconf.o: $(obj)/.tmp_qtcheck
 
 ifeq ($(qconf-target),1)
-- 
1.7.2.5

