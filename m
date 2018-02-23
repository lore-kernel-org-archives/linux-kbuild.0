Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:45951 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751464AbeBWOW7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Feb 2018 09:22:59 -0500
Received: by mail-wr0-f194.google.com with SMTP id p104so14253412wrc.12
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Feb 2018 06:22:59 -0800 (PST)
From: Robin Jarry <robin.jarry@6wind.com>
Subject: [PATCH 1/2] kbuild: introduce HOST_EXTRALDFLAGS
Date: Fri, 23 Feb 2018 15:22:14 +0100
Message-Id: <16dd034819f38300bf71c8866af37cade0017585.1519393674.git.robin.jarry@6wind.com>
In-Reply-To: <cover.1519393674.git.robin.jarry@6wind.com>
References: <cover.1519393674.git.robin.jarry@6wind.com>
In-Reply-To: <cover.1519393674.git.robin.jarry@6wind.com>
References: <cover.1519393674.git.robin.jarry@6wind.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@kernel.org>

Add a new user specifiable variable to provide specific linker options
(-L, -rpath, ...) for host programs build.

Append these options to HOSTLDFLAGS.

Signed-off-by: Robin Jarry <robin.jarry@6wind.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Ingo Molnar <mingo@kernel.org>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index d9cf3a40eda9..e9609319d2b8 100644
--- a/Makefile
+++ b/Makefile
@@ -365,6 +365,7 @@ HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
 		-fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
 HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS)
 HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
+HOSTLDFLAGS  += $(HOST_EXTRALDFLAGS)
 HOST_LOADLIBES := $(HOST_LFS_LIBS)
 
 # Make variables (CC, etc...)
-- 
2.11.0

