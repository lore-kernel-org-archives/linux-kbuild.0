Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:40314 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752380Ab2AWLy0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Jan 2012 06:54:26 -0500
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH] kbuild: disable -Wmissing-field-initializers for W=1
Date: Mon, 23 Jan 2012 05:54:10 +0200
Message-Id: <1327290850-5405-1-git-send-email-kirill.shutemov@linux.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

-Wmissing-field-initializers is too noisy to be useful on W=1. Let's
move it to W=2.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 scripts/Makefile.build |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d2b366c..1535a2f 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -62,7 +62,7 @@ endif
 ifdef KBUILD_ENABLE_EXTRA_GCC_CHECKS
 warning-  := $(empty)
 
-warning-1 := -Wextra -Wunused -Wno-unused-parameter
+warning-1 := -Wextra -Wunused -Wno-unused-parameter -Wno-missing-field-initializers
 warning-1 += -Wmissing-declarations
 warning-1 += -Wmissing-format-attribute
 warning-1 += -Wmissing-prototypes
@@ -75,6 +75,7 @@ warning-2 += -Wcast-align
 warning-2 += -Wdisabled-optimization
 warning-2 += -Wnested-externs
 warning-2 += -Wshadow
+warning-2 += -Wmissing-field-initializers
 warning-2 += $(call cc-option, -Wlogical-op)
 
 warning-3 := -Wbad-function-cast
-- 
1.7.8.3

