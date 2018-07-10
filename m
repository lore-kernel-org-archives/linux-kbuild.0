Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:34611 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933380AbeGJAqW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jul 2018 20:46:22 -0400
Received: by mail-qk0-f195.google.com with SMTP id b66-v6so10722918qkj.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jul 2018 17:46:21 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCHv2 4/7] treewide: Rename HOSTCXXFLAGS to KBUILD_HOSTCXXFLAGS
Date: Mon,  9 Jul 2018 17:45:59 -0700
Message-Id: <20180710004602.21599-5-labbott@redhat.com>
In-Reply-To: <20180710004602.21599-1-labbott@redhat.com>
References: <20180710004602.21599-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>
Cc: Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Jarry <robin.jarry@6wind.com>

In preparation for enabling command line CXXFLAGS, re-name HOSTCXXFLAGS to
KBUILD_HOSTCXXFLAGS as the internal use only flags. This should not have any
visible effects.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
v2: Dropped name change for individual files (still HOSTCXXFLAGS_foo)
---
 Makefile              | 4 ++--
 scripts/Makefile.host | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 1feec222f3c1..857ccd28dc36 100644
--- a/Makefile
+++ b/Makefile
@@ -361,7 +361,7 @@ HOSTCC       = gcc
 HOSTCXX      = g++
 KBUILD_HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
 		-fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
-HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS)
+KBUILD_HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS)
 HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
 HOST_LOADLIBES := $(HOST_LFS_LIBS)
 
@@ -432,7 +432,7 @@ GCC_PLUGINS_CFLAGS :=
 export ARCH SRCARCH CONFIG_SHELL HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP HOSTLDFLAGS HOST_LOADLIBES
 export MAKE LEX YACC AWK GENKSYMS INSTALLKERNEL PERL PYTHON PYTHON2 PYTHON3 UTS_MACHINE
-export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
+export HOSTCXX KBUILD_HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
 
 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS LDFLAGS
 export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 09f00dae21fe..455d85aa1d37 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -64,7 +64,7 @@ host-cxxshobjs	:= $(addprefix $(obj)/,$(host-cxxshobjs))
 
 _hostc_flags   = $(KBUILD_HOSTCFLAGS)   $(HOST_EXTRACFLAGS)   \
                  $(HOSTCFLAGS_$(basetarget).o)
-_hostcxx_flags = $(HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
+_hostcxx_flags = $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
                  $(HOSTCXXFLAGS_$(basetarget).o)
 
 ifeq ($(KBUILD_SRC),)
-- 
2.17.1

