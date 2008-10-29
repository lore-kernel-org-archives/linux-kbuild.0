Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:49451 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754341AbYJ2VbA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Oct 2008 17:31:00 -0400
Message-Id: <200810292120.m9TLKBh6019373@imap1.linux-foundation.org>
Subject: [patch 09/13] kbuild: fix KBUILD_EXTRA_SYMBOLS
From: akpm@linux-foundation.org
Date: Wed, 29 Oct 2008 14:20:11 -0700
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, pva@gentoo.org

From: Peter Volkov <pva@gentoo.org>

Taken from http://bugzilla.kernel.org/show_bug.cgi?id=11567

If you even define KBUILD_EXTRA_SYMBOLS in Makefile it will not be expanded
into command line argument for modpost.

Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/Makefile.modpost |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN scripts/Makefile.modpost~kbuild-fix-kbuild_extra_symbols scripts/Makefile.modpost
--- a/scripts/Makefile.modpost~kbuild-fix-kbuild_extra_symbols
+++ a/scripts/Makefile.modpost
@@ -82,7 +82,7 @@ modpost = scripts/mod/modpost           
  $(if $(CONFIG_MODULE_SRCVERSION_ALL),-a,)       \
  $(if $(KBUILD_EXTMOD),-i,-o) $(kernelsymfile)   \
  $(if $(KBUILD_EXTMOD),-I $(modulesymfile))      \
- $(if $(KBUILD_EXTRA_SYMBOLS), $(patsubst %, -e %,$(EXTRA_SYMBOLS))) \
+ $(if $(KBUILD_EXTRA_SYMBOLS), $(patsubst %, -e %,$(KBUILD_EXTRA_SYMBOLS))) \
  $(if $(KBUILD_EXTMOD),-o $(modulesymfile))      \
  $(if $(CONFIG_DEBUG_SECTION_MISMATCH),,-S)      \
  $(if $(CONFIG_MARKERS),-K $(kernelmarkersfile)) \
_
