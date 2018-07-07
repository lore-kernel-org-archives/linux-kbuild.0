Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:36746 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932714AbeGGBHe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Jul 2018 21:07:34 -0400
Received: by mail-qt0-f194.google.com with SMTP id f1-v6so11398980qti.3
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Jul 2018 18:07:33 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCH 4/7] treewide: Rename HOSTCXXFLAGS to KBUILD_HOSTCXXFLAGS
Date: Fri,  6 Jul 2018 18:07:06 -0700
Message-Id: <20180707010709.16648-5-labbott@redhat.com>
In-Reply-To: <20180707010709.16648-1-labbott@redhat.com>
References: <20180707010709.16648-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>
Cc: Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Jarry <robin.jarry@6wind.com>


In preparation for enabling command line CXXFLAGS, re-name HOSTCXXFLAGS to
KBUILD_HOSTCXXFLAGS as the internal use only flags. This should not have any
visible effects.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
 Makefile                 | 4 ++--
 scripts/Makefile.host    | 4 ++--
 scripts/kconfig/Makefile | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 16cab22b1f40..9c3f1864d678 100644
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
index 7a4c90f2b0ce..1c153cc5b530 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -64,8 +64,8 @@ host-cxxshobjs	:= $(addprefix $(obj)/,$(host-cxxshobjs))
 
 _hostc_flags   = $(KBUILD_HOSTCFLAGS)   $(HOST_EXTRACFLAGS)   \
                  $(KBUILD_HOSTCFLAGS_$(basetarget).o)
-_hostcxx_flags = $(HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
-                 $(HOSTCXXFLAGS_$(basetarget).o)
+_hostcxx_flags = $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
+                 $(KBUILD_HOSTCXXFLAGS_$(basetarget).o)
 
 ifeq ($(KBUILD_SRC),)
 __hostc_flags	= $(_hostc_flags)
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index f98a22618e1f..37605d92c597 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -192,7 +192,7 @@ qconf-cxxobjs	:= qconf.o
 qconf-objs	:= zconf.tab.o
 
 HOSTLOADLIBES_qconf	= $(shell . $(obj)/.qconf-cfg && echo $$libs)
-HOSTCXXFLAGS_qconf.o	= $(shell . $(obj)/.qconf-cfg && echo $$cflags)
+KBUILD_HOSTCXXFLAGS_qconf.o	= $(shell . $(obj)/.qconf-cfg && echo $$cflags)
 
 $(obj)/qconf.o: $(obj)/.qconf-cfg $(obj)/qconf.moc
 
-- 
2.17.1

