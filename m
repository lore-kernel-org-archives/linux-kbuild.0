Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f182.google.com ([209.85.220.182]:43739 "EHLO
        mail-qk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932873AbeGGBHk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Jul 2018 21:07:40 -0400
Received: by mail-qk0-f182.google.com with SMTP id z74-v6so7212055qkb.10
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Jul 2018 18:07:40 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCH 7/7] Kbuild: Use HOST*FLAGS options from the command line
Date: Fri,  6 Jul 2018 18:07:09 -0700
Message-Id: <20180707010709.16648-8-labbott@redhat.com>
In-Reply-To: <20180707010709.16648-1-labbott@redhat.com>
References: <20180707010709.16648-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>
Cc: Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Jarry <robin.jarry@6wind.com>

Now that we have the rename in place, reuse the HOST*FLAGS options as
something that can be set from the command line and included with the
rest of the flags.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
 Makefile | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index d925af1fb11b..77c74b3cf30b 100644
--- a/Makefile
+++ b/Makefile
@@ -360,10 +360,11 @@ HOST_LFS_LIBS := $(shell getconf LFS_LIBS)
 HOSTCC       = gcc
 HOSTCXX      = g++
 KBUILD_HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
-		-fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
-KBUILD_HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS)
-KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
-KBUILD_HOSTLDLIBS := $(HOST_LFS_LIBS)
+		-fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS) \
+		$(HOSTCFLAGS)
+KBUILD_HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS)
+KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
+KBUILD_HOSTLDLIBS := $(HOST_LFS_LIBS) $(HOST_LOADLIBES)
 
 # Make variables (CC, etc...)
 AS		= $(CROSS_COMPILE)as
-- 
2.17.1

