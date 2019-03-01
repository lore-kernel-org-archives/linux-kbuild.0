Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:17147 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfCAHLH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Mar 2019 02:11:07 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] kbuild: remove cc-version macro
Date: Fri,  1 Mar 2019 16:10:21 +0900
Message-Id: <1551424222-3727-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1551424222-3727-1-git-send-email-yamada.masahiro@socionext.com>
References: <1551424222-3727-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>

There is no more direct user of this macro; it is only used by
cc-ifversion.

Calling this macro is not efficient since it invokes the compiler to
get the compiler version. CONFIG_GCC_VERSION is already calculated in
the Kconfig stage, so Makefile can reuse it.

Here is a note about the slight difference between cc-version and
CONFIG_GCC_VERSION:

When using Clang, cc-version is evaluated to '0402' because Clang
defines __GNUC__ and __GNUC__MINOR__, and looks like GCC 4.2 in the
version point of view. On the other hand, CONFIG_GCC_VERSION=0
when $(CC) is clang.

There are currently two users of cc-ifversion:
  arch/mips/loongson64/Platform
  arch/powerpc/Makefile

They are not affected by this change.

The format of cc-version is <major><minor>, while CONFIG_GCC_VERSION
<major><minor><patch>. I adjusted cc-ifversion for the difference of
the number of digits.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/kbuild/makefiles.txt | 17 -----------------
 scripts/Kbuild.include             |  5 +----
 2 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 48eab0b..f124be6 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -499,23 +499,6 @@ more details, with real examples.
 	In the above example, -Wno-unused-but-set-variable will be added to
 	KBUILD_CFLAGS only if gcc really accepts it.
 
-    cc-version
-	cc-version returns a numerical version of the $(CC) compiler version.
-	The format is <major><minor> where both are two digits. So for example
-	gcc 3.41 would return 0341.
-	cc-version is useful when a specific $(CC) version is faulty in one
-	area, for example -mregparm=3 was broken in some gcc versions
-	even though the option was accepted by gcc.
-
-	Example:
-		#arch/x86/Makefile
-		cflags-y += $(shell \
-		if [ $(cc-version) -ge 0300 ] ; then \
-			echo "-mregparm=3"; fi ;)
-
-	In the above example, -mregparm=3 is only used for gcc version greater
-	than or equal to gcc 3.0.
-
     cc-ifversion
 	cc-ifversion tests the version of $(CC) and equals the fourth parameter
 	if version expression is true, or the fifth (if given) if the version
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index d93250b..b59983e 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -138,12 +138,9 @@ cc-option-yn = $(call try-run,\
 cc-disable-warning = $(call try-run,\
 	$(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
 
-# cc-version
-cc-version = $(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC))
-
 # cc-ifversion
 # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
-cc-ifversion = $(shell [ $(cc-version) $(1) $(2) ] && echo $(3) || echo $(4))
+cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
 
 # cc-ldoption
 # Usage: ldflags += $(call cc-ldoption, -Wl$(comma)--hash-style=both)
-- 
2.7.4
