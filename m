Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:12903 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755818AbaBRO3q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Feb 2014 09:29:46 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 02/20] lto: Disable LTO for hweight functions
Date: Tue, 18 Feb 2014 15:28:40 +0100
Message-Id: <1392733738-8290-3-git-send-email-andi@firstfloor.org>
In-Reply-To: <1392733738-8290-1-git-send-email-andi@firstfloor.org>
References: <1392733738-8290-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: sam@ravnborg.org, x86@kernel.org, linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

x86 calls the hweight library functions with special calling conventions.
LTO doesn't support compiling individual files with special options.
Just disable LTO for the file.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 lib/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/Makefile b/lib/Makefile
index 48140e3..2057304 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -46,7 +46,9 @@ obj-$(CONFIG_CHECK_SIGNATURE) += check_signature.o
 obj-$(CONFIG_DEBUG_LOCKING_API_SELFTESTS) += locking-selftest.o
 
 GCOV_PROFILE_hweight.o := n
-CFLAGS_hweight.o = $(subst $(quote),,$(CONFIG_ARCH_HWEIGHT_CFLAGS))
+CFLAGS_hweight.o = $(subst $(quote),,$(CONFIG_ARCH_HWEIGHT_CFLAGS)) \
+		   $(DISABLE_LTO)
+
 obj-$(CONFIG_GENERIC_HWEIGHT) += hweight.o
 
 obj-$(CONFIG_BTREE) += btree.o
-- 
1.8.5.2

