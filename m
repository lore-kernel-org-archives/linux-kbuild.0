Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:38336 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755589AbdESE2b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 May 2017 00:28:31 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: simplify silent build (-s) detection
Date: Fri, 19 May 2017 13:28:16 +0900
Message-Id: <1495168096-22440-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

This allows to detect -s option without checking GNU Make version.

As commit e36aaea28972 ("kbuild: Fix silent builds with make-4")
pointed out, GNU Make 4.x changed the way/order it presents the
command line options into MAKEFLAGS.

In Make 3.8x, 's' is always be the first in a group of short options.
The group could be prefixed with '-'.

In Make 4.x, 's' is always the last in a group of short options.

As commit e6ac89fabd03 ("kbuild: Correctly deal with make options
which contain an 's'") addressed, we also need to deal with long
options that end with 's', like --warn-undefined-variables.

Test cases:

[1] command line input:    make --silent
     -> MAKEFLAGS for Make 3.8x:    s
     -> MAKEFLAGS for Make 4.x :    s

[2] command line input:    make -srR
     -> MAKEFLAGS for Make 3.8x:    sRr
     -> MAKEFLAGS for Make 4.x :    rRs

[3] command line input:    make -s -rR --warn-undefined-variables
     -> MAKEFLAGS for Make 3.8x:    --warn-undefined-variables -sRr
     -> MAKEFLAGS for Make 4.x :    rRs --warn-undefined-variables

We can take care of them, by filtering out long options (--%),
then matching -s% s% %s patterns.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index b1ee4a4..d8b5c42 100644
--- a/Makefile
+++ b/Makefile
@@ -84,17 +84,10 @@ endif
 # If the user is running make -s (silent mode), suppress echoing of
 # commands
 
-ifneq ($(filter 4.%,$(MAKE_VERSION)),)	# make-4
-ifneq ($(filter %s ,$(firstword x$(MAKEFLAGS))),)
+ifneq ($(filter -s% s% %s,$(filter-out --%,$(MAKEFLAGS))),)
   quiet=silent_
   tools_silent=s
 endif
-else					# make-3.8x
-ifneq ($(filter s% -s%,$(MAKEFLAGS)),)
-  quiet=silent_
-  tools_silent=-s
-endif
-endif
 
 export quiet Q KBUILD_VERBOSE
 
-- 
2.7.4

