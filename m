Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34126 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbfCNXmh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Mar 2019 19:42:37 -0400
Received: by mail-pf1-f196.google.com with SMTP id v64so4936875pfb.1
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Mar 2019 16:42:36 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] kbuild: Make NOSTDINC_FLAGS a simply expanded variable
Date: Thu, 14 Mar 2019 16:41:59 -0700
Message-Id: <20190314234159.191745-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Douglas Anderson <dianders@chromium.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

During a simple no-op (nothing changed) build I saw 39 invocations of
the C compiler with the argument "-print-file-name=include".  We don't
need to call the C compiler 39 times for this--one time will suffice.

Let's change NOSTDINC_FLAGS to a simply expanded variable to avoid
this since there doesn't appear to be any reason it should be
recursively expanded.

On my build this shaved ~400 ms off my "no-op" build.

Note that the recursive expansion seems to date back to the (really
old) commit e8f5bdb02ce0 ("[PATCH] Makefile include path ordering").
It's a little unclear to me if the point of that patch was to switch
the variable to be recursively expanded (which it did) or to avoid
directly assigning to NOSTDINC_FLAGS (AKA to switch to +=) because
someone else (out of tree?) was setting it.  I presume later since if
the only goal was to switch to recursive expansion the patch would
have just removed the ":".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9ef547fc7ffe..3034ba66ad51 100644
--- a/Makefile
+++ b/Makefile
@@ -402,7 +402,7 @@ CHECK		= sparse
 
 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
 		  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
-NOSTDINC_FLAGS  =
+NOSTDINC_FLAGS :=
 CFLAGS_MODULE   =
 AFLAGS_MODULE   =
 LDFLAGS_MODULE  =
-- 
2.21.0.360.g471c308f928-goog
