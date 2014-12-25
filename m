Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:65270 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752119AbaLYFby (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Dec 2014 00:31:54 -0500
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 1/6] kbuild: fix cc-ifversion macro
Date: Thu, 25 Dec 2014 14:31:23 +0900
Message-Id: <1419485488-22336-2-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1419485488-22336-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1419485488-22336-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, Michal Marek <mmarek@suse.cz>, Masahiro Yamada <yamada.m@jp.panasonic.com>, Robert Richter <rrichter@cavium.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org

The macro "cc-version" takes no argument.  Drop $(CC) from the
"cc-ifversion" definition.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---

 scripts/Kbuild.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index a6f7914..a972666 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -146,7 +146,7 @@ cc-fullversion = $(shell $(KBUILD_SHELL) \
 
 # cc-ifversion
 # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
-cc-ifversion = $(shell [ $(call cc-version, $(CC)) $(1) $(2) ] && echo $(3))
+cc-ifversion = $(shell [ $(call cc-version) $(1) $(2) ] && echo $(3))
 
 # cc-ldoption
 # Usage: ldflags += $(call cc-ldoption, -Wl$(comma)--hash-style=both)
-- 
1.9.1

