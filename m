Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:40420 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753975AbZIRT5V (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Sep 2009 15:57:21 -0400
Message-Id: <200909181949.n8IJnYUK019239@imap1.linux-foundation.org>
Subject: [patch 14/18] kbuild: fix ld-option Makefile macro to really work
From: akpm@linux-foundation.org
Date: Fri, 18 Sep 2009 12:49:34 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, andi@firstfloor.org, ak@linux.intel.com

From: Andi Kleen <andi@firstfloor.org>

Needed for the next patch, "kbuild: check if linker supports the -X
option".

Signed-off-by: Andi Kleen <ak@linux.intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/Kbuild.include |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff -puN scripts/Kbuild.include~kbuild-fix-ld-option-makefile-macro-to-really-work scripts/Kbuild.include
--- a/scripts/Kbuild.include~kbuild-fix-ld-option-makefile-macro-to-really-work
+++ a/scripts/Kbuild.include
@@ -83,11 +83,12 @@ TMPOUT := $(if $(KBUILD_EXTMOD),$(firstw
 # is automatically cleaned up.
 try-run = $(shell set -e;		\
 	TMP="$(TMPOUT).$$$$.tmp";	\
+	TMPO="$(TMPOUT).$$$$.o";	\
 	if ($(1)) >/dev/null 2>&1;	\
 	then echo "$(2)";		\
 	else echo "$(3)";		\
 	fi;				\
-	rm -f "$$TMP")
+	rm -f "$$TMP" "$$TMPO")
 
 # as-option
 # Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
@@ -133,7 +134,7 @@ cc-ifversion = $(shell [ $(call cc-versi
 # ld-option
 # Usage: ldflags += $(call ld-option, -Wl$(comma)--hash-style=both)
 ld-option = $(call try-run,\
-	$(CC) $(1) -nostdlib -xc /dev/null -o "$$TMP",$(1),$(2))
+	$(CC) /dev/null -c -o "$$TMPO" ; $(LD) $(1) "$$TMPO" -o "$$TMP",$(1),$(2))
 
 ######
 
_
