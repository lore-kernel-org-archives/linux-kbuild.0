Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728180AbgEELy0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 May 2020 07:54:26 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A3FDC061A0F
        for <linux-kbuild@vger.kernel.org>; Tue,  5 May 2020 04:54:26 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id g4so1301755ljl.2
        for <linux-kbuild@vger.kernel.org>; Tue, 05 May 2020 04:54:26 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] scripts: fix deprecated always and hostprogs-y
Date: Tue,  5 May 2020 13:54:20 +0200
Message-Id: <20200505115420.18765-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: masahiroy@kernel.org, michal.lkml@markovi.net
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>

When I did an allmodconfig build the following warning showed up:

scripts/Makefile.lib:8: 'always' is deprecated. Please use 'always-y' instead
scripts/Makefile.lib:12: 'hostprogs-y' and 'hostprogs-m' are deprecated. Please use 'hostprogs' instead

Rework to use the new 'always-y' and 'hostprogs'.

Fixes: ee066c3ddf7b ("kbuild: warn if always, hostprogs-y, or hostprogs-m is used")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 samples/watch_queue/Makefile | 4 ++--
 scripts/Makefile.build       | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/samples/watch_queue/Makefile b/samples/watch_queue/Makefile
index eec00dd0a8df..8511fb6c53d2 100644
--- a/samples/watch_queue/Makefile
+++ b/samples/watch_queue/Makefile
@@ -1,7 +1,7 @@
 # List of programs to build
-hostprogs-y := watch_test
+hostprogs := watch_test
 
 # Tell kbuild to always build the programs
-always := $(hostprogs-y)
+always-y := $(hostprogs)
 
 HOSTCFLAGS_watch_test.o += -I$(objtree)/usr/include
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 3665b1a0bc8e..abdba70f33a1 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -15,7 +15,6 @@ obj-y :=
 obj-m :=
 lib-y :=
 lib-m :=
-always :=
 always-y :=
 always-m :=
 targets :=
-- 
2.20.1
