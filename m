Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:46298 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1757624Ab1DXUTR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 24 Apr 2011 16:19:17 -0400
Message-ID: <4DB4832E.6080009@verizon.net>
Date: Sun, 24 Apr 2011 16:08:14 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: [PATCH] kbuild: allow headerdep to work in KBUILD_OUTPUT and add
 targets to PHONY
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz

This patch fixes the headerdep target so it will work when make is executed from KBUILD_OUTPUT.
It also adds a few targets to PHONY so they are always executed.

Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 Makefile |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index b967b96..093c9d2 100644
--- a/Makefile
+++ b/Makefile
@@ -991,7 +991,8 @@ include/generated/utsrelease.h: include/config/kernel.release FORCE
 
 PHONY += headerdep
 headerdep:
-	$(Q)find include/ -name '*.h' | xargs --max-args 1 scripts/headerdep.pl
+	$(Q)find $(srctree)/include/ -name '*.h' | xargs --max-args 1 \
+	$(srctree)/scripts/headerdep.pl -I$(srctree)/include
 
 # ---------------------------------------------------------------------------
 
@@ -1392,6 +1393,8 @@ tags TAGS cscope gtags: FORCE
 # Scripts to check various things for consistency
 # ---------------------------------------------------------------------------
 
+PHONY += includecheck versioncheck coccicheck namespacecheck export_report
+
 includecheck:
 	find * $(RCS_FIND_IGNORE) \
 		-name '*.[hcS]' -type f -print | sort \
-- 
1.7.5.rc1

