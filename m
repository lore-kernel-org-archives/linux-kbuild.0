Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:25258 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751776AbdJDD5c (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Oct 2017 23:57:32 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/4] kbuild: move "_all" target out of $(KBUILD_SRC) conditional
Date: Wed,  4 Oct 2017 12:56:05 +0900
Message-Id: <1507089367-10402-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1507089367-10402-1-git-send-email-yamada.masahiro@socionext.com>
References: <1507089367-10402-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

The first "_all" occurrence around line 120 is only visible when
KBUILD_SRC is unset.

If O=... is specified, the working directory is relocated, then the
only second occurrence around line 193 is visible, that is not set
to PHONY.

Move the first one to an always visible place.  This clarifies "_all"
is our default target and it is always set to PHONY.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 8d900ba..39a7c03 100644
--- a/Makefile
+++ b/Makefile
@@ -10,6 +10,10 @@ NAME = Fearless Coyote
 # Comments in this file are targeted only to the developer, do not
 # expect to learn how to build the kernel reading this file.
 
+# That's our default target when none is given on the command line
+PHONY := _all
+_all:
+
 # o Do not use make's built-in rules and variables
 #   (this increases performance and avoids hard-to-debug behaviour);
 # o Look for make include files relative to root of kernel src
@@ -116,10 +120,6 @@ ifeq ("$(origin O)", "command line")
   KBUILD_OUTPUT := $(O)
 endif
 
-# That's our default target when none is given on the command line
-PHONY := _all
-_all:
-
 # Cancel implicit rules on top Makefile
 $(CURDIR)/Makefile Makefile: ;
 
-- 
2.7.4

