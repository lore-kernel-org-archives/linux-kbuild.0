Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:58256 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbeLEL3W (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Dec 2018 06:29:22 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] kbuild: generate asm-generic wrappers if mandatory headers are missing
Date: Wed,  5 Dec 2018 20:28:05 +0900
Message-Id: <1544009286-15705-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544009286-15705-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544009286-15705-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>

Some time ago, Sam pointed out a certain degree of overwrap between
generic-y and mandatory-y. (https://lkml.org/lkml/2017/7/10/121)

I a bit tweaked the meaning of mandatory-y; now it defines the minimum
set of ASM headers that all architectures must have.

If arch does not have specific implementation of a mandatory header,
Kbuild will let it fallback to the asm-generic one by automatically
generating a wrapper. This will allow to drop lots of redundant
generic-y defines.

Previously, "mandatory" was used in the context of UAPI, but I guess
this can be extended to kernel space ASM headers.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/kbuild/makefiles.txt | 9 ++++++---
 scripts/Makefile.asm-generic       | 3 +++
 scripts/Makefile.headersinst       | 7 -------
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 8da26c6..bf28c47 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -1296,9 +1296,12 @@ See subsequent chapter for the syntax of the Kbuild file.
 
 --- 7.4 mandatory-y
 
-	mandatory-y is essentially used by include/uapi/asm-generic/Kbuild.asm
-	to define the minimum set of headers that must be exported in
-	include/asm.
+	mandatory-y is essentially used by include/(uapi/)asm-generic/Kbuild.asm
+	to define the minimum set of ASM headers that all architectures must have.
+
+	This works like optional generic-y. If a mandatory header is missing
+	in arch/$(ARCH)/include/(uapi/)/asm, Kbuild will automatically generate
+	a wrapper of the asm-generic one.
 
 	The convention is to list one subdir per line and
 	preferably in alphabetic order.
diff --git a/scripts/Makefile.asm-generic b/scripts/Makefile.asm-generic
index 760323e..c7cd23d 100644
--- a/scripts/Makefile.asm-generic
+++ b/scripts/Makefile.asm-generic
@@ -14,6 +14,9 @@ src := $(subst /generated,,$(obj))
 
 include scripts/Kbuild.include
 
+# If arch does not implement mandatory headers, fallback to asm-generic ones.
+generic-y   += $(foreach f, $(mandatory-y), $(if $(wildcard $(srctree)/$(src)/$(f)),,$(f)))
+
 generic-y   := $(addprefix $(obj)/, $(generic-y))
 generated-y := $(addprefix $(obj)/, $(generated-y))
 
diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
index d5e1314..0d4a96d 100644
--- a/scripts/Makefile.headersinst
+++ b/scripts/Makefile.headersinst
@@ -57,13 +57,6 @@ check-file    := $(installdir)/.check
 all-files     := $(header-files) $(genhdr-files)
 output-files  := $(addprefix $(installdir)/, $(all-files))
 
-ifneq ($(mandatory-y),)
-missing       := $(filter-out $(all-files),$(mandatory-y))
-ifneq ($(missing),)
-$(error Some mandatory headers ($(missing)) are missing in $(obj))
-endif
-endif
-
 # Work out what needs to be removed
 oldheaders    := $(patsubst $(installdir)/%,%,$(wildcard $(installdir)/*.h))
 unwanted      := $(filter-out $(all-files),$(oldheaders))
-- 
2.7.4
