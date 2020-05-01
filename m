Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.nic.cz ([217.31.204.67]:58688 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726405AbgEAThP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 May 2020 15:37:15 -0400
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v2] dtc: Use better check for libyaml
Date: Fri,  1 May 2020 21:37:12 +0200
Message-Id: <20200501193712.18930-1-marek.behun@nic.cz>
In-Reply-To: <20200501015147.32391-1-marek.behun@nic.cz>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: devicetree@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>, Pavel Modilaynen <pavel.modilaynen@axis.com>, Rob Herring <robh+dt@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org

The current check for libyaml based on pkg-config may succeed even if
yaml.h header is missing. Try to determine if header and library are
present by compiling a simple program.

This creates macros hostcc-header and hostcc-symbol in
scripts/Kbuild.include, which check whether a header file and a library
symbol are present on host system, by compiling a simple program.

Fixes: 067c650c456e ("dtc: Use pkg-config to locate libyaml")
Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Pavel Modilaynen <pavel.modilaynen@axis.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
---
 scripts/Kbuild.include | 14 ++++++++++++++
 scripts/dtc/Makefile   | 10 ++++++----
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 6cabf20ce66a..33af76aa86c1 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -154,6 +154,20 @@ ld-version = $(shell $(LD) --version | $(srctree)/scripts/ld-version.sh)
 # Usage:  $(call ld-ifversion, -ge, 22252, y)
 ld-ifversion = $(shell [ $(ld-version) $(1) $(2) ] && echo $(3) || echo $(4))
 
+# hostcc-header
+# Usage: $(call hostcc-header,header.h,-I/usr/include/libname)
+# third argument is optional
+hostcc-header = $(call try-run,					\
+	{ echo "\#include <$(1)>" ; echo "int main(){}"; } |	\
+	$(HOSTCC) $(2) -x c - -o /dev/null,y,n)
+
+# hostcc-symbol
+# Usage: $(call hostcc-symbol,symbol_name,-llibname)
+# third argument is optional
+hostcc-symbol = $(call try-run,				\
+	echo "void $(1)();int main(){$(1)();}" |	\
+	$(HOSTCC) -x c - -o /dev/null $(2),y,n)
+
 ######
 
 ###
diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index ef85f8b7d4a7..d04c03b0899d 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -12,15 +12,17 @@ dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
 # Source files need to get at the userspace version of libfdt_env.h to compile
 HOST_EXTRACFLAGS := -I $(srctree)/$(src)/libfdt
 
-ifeq ($(shell pkg-config --exists yaml-0.1 2>/dev/null && echo yes),)
+_yaml_libs = $(shell pkg-config --libs yaml-0.1 2>/dev/null)
+ifeq ($(call hostcc-header,yaml.h)$(call hostcc-symbol,yaml_get_version,\
+				    $(_yaml_libs)),yy)
+dtc-objs	+= yamltree.o
+HOSTLDLIBS_dtc	:= $(_yaml_libs)
+else
 ifneq ($(CHECK_DT_BINDING)$(CHECK_DTBS),)
 $(error dtc needs libyaml for DT schema validation support. \
 	Install the necessary libyaml development package.)
 endif
 HOST_EXTRACFLAGS += -DNO_YAML
-else
-dtc-objs	+= yamltree.o
-HOSTLDLIBS_dtc	:= $(shell pkg-config yaml-0.1 --libs)
 endif
 
 # Generated files need one more search path to include headers in source tree
-- 
2.24.1
