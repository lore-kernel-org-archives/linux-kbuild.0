Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:5554 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756014AbaBRO3w (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Feb 2014 09:29:52 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 17/20] Kbuild, bloat-o-meter: Ignore .lto_priv postfix
Date: Tue, 18 Feb 2014 15:28:55 +0100
Message-Id: <1392733738-8290-18-git-send-email-andi@firstfloor.org>
In-Reply-To: <1392733738-8290-1-git-send-email-andi@firstfloor.org>
References: <1392733738-8290-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: sam@ravnborg.org, x86@kernel.org, linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

gcc 4.9 may generate .lto_priv post fixes for LTO functions.
Ignore those for bloat-o-meter comparisons.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 scripts/bloat-o-meter | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/bloat-o-meter b/scripts/bloat-o-meter
index 549d0ab..2becdf6 100755
--- a/scripts/bloat-o-meter
+++ b/scripts/bloat-o-meter
@@ -23,6 +23,7 @@ def getsizes(file):
             if name == "linux_banner": continue
             # statics and some other optimizations adds random .NUMBER
             name = re.sub(r'\.[0-9]+', '', name)
+	    name = name.replace(".lto_priv", "")
             sym[name] = sym.get(name, 0) + int(size, 16)
     return sym
 
-- 
1.8.5.2

