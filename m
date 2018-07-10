Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:38568 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933421AbeGJAq2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jul 2018 20:46:28 -0400
Received: by mail-qt0-f195.google.com with SMTP id c5-v6so16988671qth.5
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jul 2018 17:46:28 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCHv2 7/7] Kbuild: Use HOST*FLAGS options from the command line
Date: Mon,  9 Jul 2018 17:46:02 -0700
Message-Id: <20180710004602.21599-8-labbott@redhat.com>
In-Reply-To: <20180710004602.21599-1-labbott@redhat.com>
References: <20180710004602.21599-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>
Cc: Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Jarry <robin.jarry@6wind.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org


Now that we have the rename in place, reuse the HOST*FLAGS options as
something that can be set from the command line and included with the
rest of the flags.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
v2: Use the correct name for HOSTLDLIBS, update documentation.
---
 Documentation/kbuild/kbuild.txt | 16 ++++++++++++++++
 Makefile                        |  9 +++++----
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
index 6c9c69ec3986..9847a5974826 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -238,3 +238,19 @@ KBUILD_VMLINUX_LIBS
 All .a "lib" files for vmlinux.
 KBUILD_VMLINUX_INIT, KBUILD_VMLINUX_MAIN, and KBUILD_VMLINUX_LIBS together
 specify all the object files used to link vmlinux.
+
+HOSTCFLAGS
+--------------------------------------------------
+Additional flags to be passed to $(HOSTCC) when building host programs.
+
+HOSTLDFLAGS
+--------------------------------------------------
+Additional flags to be passed to $(HOSTLD) when building host programs.
+
+HOSTCXXFLAGS
+--------------------------------------------------
+Additional flags to be passed to $(HOSTCXX) when building host programs.
+
+HOSTLDLIBS
+--------------------------------------------------
+Additional libraries to link against when building host programs.
diff --git a/Makefile b/Makefile
index 96e34381d9ee..c2ee1d4c12c9 100644
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
+KBUILD_HOSTLDLIBS := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
 
 # Make variables (CC, etc...)
 AS		= $(CROSS_COMPILE)as
-- 
2.17.1

