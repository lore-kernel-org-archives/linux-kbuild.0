Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:35333 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756266AbbE2UI6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 May 2015 16:08:58 -0400
From: Chris J Arges <chris.j.arges@canonical.com>
Subject: [PATCH v2] package: Makefile: ensure $MAKE can use jobserver
Date: Fri, 29 May 2015 15:08:51 -0500
Message-Id: <1432930131-5846-1-git-send-email-chris.j.arges@canonical.com>
In-Reply-To: <CAAqcGHkuDe9+mTuLeMq-BV4+zJBoqFWQ4nawfEMRTm=0oKYSgA@mail.gmail.com>
References: <CAAqcGHkuDe9+mTuLeMq-BV4+zJBoqFWQ4nawfEMRTm=0oKYSgA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: riku.voipio@linaro.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

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
index bc6aa00..ea2a405 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -97,7 +97,7 @@ quiet_cmd_builddeb = BUILDDEB
 
 deb-pkg: FORCE
 	$(MAKE) KBUILD_SRC=
-	$(call cmd,builddeb)
+	+$(call cmd,builddeb)
 
 clean-dirs += $(objtree)/debian/
 
-- 
1.9.1

