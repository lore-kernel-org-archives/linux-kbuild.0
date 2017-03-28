Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f54.google.com ([74.125.83.54]:35318 "EHLO
        mail-pg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753556AbdC1BTf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Mar 2017 21:19:35 -0400
Received: by mail-pg0-f54.google.com with SMTP id 81so42121116pgh.2
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Mar 2017 18:19:34 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] kbuild: use -Oz instead of -Os when using clang
Date: Mon, 27 Mar 2017 18:19:09 -0700
Message-Id: <20170328011909.150513-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Behan Webster <behanw@converseincode.com>, Greg Hackmann <ghackmann@google.com>, Grant Grundler <grundler@chromium.org>, Michael Davidson <md@google.com>, Peter Foley <pefoley2@pefoley.com>, Matthias Kaehlcke <mka@chromium.org>

This generates smaller resulting object code when compiled with clang.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b2faa9319372..66bcdbf58371 100644
--- a/Makefile
+++ b/Makefile
@@ -638,7 +638,8 @@ KBUILD_CFLAGS	+= $(call cc-option,-fdata-sections,)
 endif
 
 ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
-KBUILD_CFLAGS	+= -Os $(call cc-disable-warning,maybe-uninitialized,)
+KBUILD_CFLAGS	+= $(call cc-option,-Oz,-Os)
+KBUILD_CFLAGS	+= $(call cc-disable-warning,maybe-uninitialized,)
 else
 ifdef CONFIG_PROFILE_ALL_BRANCHES
 KBUILD_CFLAGS	+= -O2 $(call cc-disable-warning,maybe-uninitialized,)
-- 
2.12.2.564.g063fe858b8-goog

