Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:51384 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S934033Ab1D2WjR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Apr 2011 18:39:17 -0400
Message-ID: <4DBB3DE8.3080407@verizon.net>
Date: Fri, 29 Apr 2011 18:38:32 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: [PATCH V2 6/7] kbuild: update Makefile in preperation for moving
 docproc
Content-Type: multipart/mixed;
	boundary="------------080009000804000402030503"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

--------------080009000804000402030503
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

This patch updates Makefile in preperation for moving docproc.

Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 56971f9..c823059 100644
--- a/Makefile
+++ b/Makefile
@@ -1291,6 +1291,7 @@ $(help-board-dirs): help-%:
 # Documentation targets
 #
---------------------------------------------------------------------------
 %docs: scripts_basic FORCE
+	$(Q)$(MAKE) $(build)=scripts build_docproc
 	$(Q)$(MAKE) $(build)=Documentation/DocBook $@

 else # KBUILD_EXTMOD
-- 
1.7.5.rc1



--------------080009000804000402030503
Content-Type: text/plain;
	name="kbuild-update-Makefile-in-preperation-for-moving-doc.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="kbuild-update-Makefile-in-preperation-for-moving-doc.patch"

From 5a882a289acb87509fd5a7c58bd79c2cf2212624 Mon Sep 17 00:00:00 2001
From: Peter Foley <pefoley2@verizon.net>
Date: Tue, 26 Apr 2011 19:24:36 -0400
Subject: [PATCH 6/7] kbuild: update Makefile in preperation for moving docproc


Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 56971f9..c823059 100644
--- a/Makefile
+++ b/Makefile
@@ -1291,6 +1291,7 @@ $(help-board-dirs): help-%:
 # Documentation targets
 # ---------------------------------------------------------------------------
 %docs: scripts_basic FORCE
+	$(Q)$(MAKE) $(build)=scripts build_docproc
 	$(Q)$(MAKE) $(build)=Documentation/DocBook $@
 
 else # KBUILD_EXTMOD
-- 
1.7.5.rc1



--------------080009000804000402030503--
