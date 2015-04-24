Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:50373 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966580AbbDXSZy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 24 Apr 2015 14:25:54 -0400
From: Chris J Arges <chris.j.arges@canonical.com>
Subject: [PATCH 1/2] package: Makefile: ensure $MAKE can use jobserver
Date: Fri, 24 Apr 2015 13:25:39 -0500
Message-Id: <1429899940-32366-2-git-send-email-chris.j.arges@canonical.com>
In-Reply-To: <1429899940-32366-1-git-send-email-chris.j.arges@canonical.com>
References: <1429899940-32366-1-git-send-email-chris.j.arges@canonical.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz
Cc: linux-kernel@vger.kernel.org, Chris J Arges <chris.j.arges@canonical.com>

When using make deb-pkg, builddeb is called without proper MAKEFLAGS due to the
script being invoked without '+'. This results in the following message when
building:
warning: jobserver unavailable: using -j1. Add `+' to parent make rule

Add the '+' so the make operations can be parallelized.

Signed-off-by: Chris J Arges <chris.j.arges@canonical.com>
---
 scripts/package/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 99ca6e7..0dbfae7 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -88,7 +88,7 @@ quiet_cmd_builddeb = BUILDDEB
 
 deb-pkg: FORCE
 	$(MAKE) KBUILD_SRC=
-	$(call cmd,builddeb)
+	+$(call cmd,builddeb)
 
 clean-dirs += $(objtree)/debian/
 
-- 
1.9.1

