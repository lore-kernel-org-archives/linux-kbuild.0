Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from s3.sipsolutions.net ([144.76.63.242]:55016 "EHLO
        sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932231AbeGIIUp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jul 2018 04:20:45 -0400
From: Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH] build: avoid evaluating cc-ifversion for ever objtool invocation
Date: Mon,  9 Jul 2018 10:20:36 +0200
Message-Id: <20180709082036.11190-1-johannes@sipsolutions.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Johannes Berg <johannes.berg@intel.com>

From: Johannes Berg <johannes.berg@intel.com>

To speed up the build a little bit, avoid evaluating cc-ifversion for
every objtool invocation. The variable needs to be evaluated every
time it's used because of the $(if $(part-of-module)...) in it, but
we don't need to call out to the compiler to get its version every
time.

Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 scripts/Makefile.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index e7889f486ca1..4f4557bc96f0 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -257,7 +257,8 @@ endif
 ifdef CONFIG_GCOV_KERNEL
 objtool_args += --no-unreachable
 else
-objtool_args += $(call cc-ifversion, -lt, 0405, --no-unreachable)
+_no_unreachable_lt_0405 := $(call cc-ifversion, -lt, 0405, --no-unreachable)
+objtool_args += $(_no_unreachable_lt_0405)
 endif
 ifdef CONFIG_RETPOLINE
 ifneq ($(RETPOLINE_CFLAGS),)
-- 
2.14.4

