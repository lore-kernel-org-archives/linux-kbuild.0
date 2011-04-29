Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:35882 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S933917Ab1D2VlX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Apr 2011 17:41:23 -0400
Message-ID: <4DBB3056.7000106@verizon.net>
Date: Fri, 29 Apr 2011 17:40:38 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: [PATCH RESEND 4/4] kbuild: make versioncheckcheck work in KBUILD_OUTDIR
Content-Type: multipart/mixed;
	boundary="------------030901050809030307090803"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

--------------030901050809030307090803
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

This patch fixes the versioncheck target so it works when make is
invoked in KBUILD_OUTDIR.

Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index bfa0e90..56971f9 100644
--- a/Makefile
+++ b/Makefile
@@ -1401,7 +1401,7 @@ includecheck:
 		| xargs $(PERL) -w $(srctree)/scripts/checkincludes.pl

 versioncheck:
-	find * $(RCS_FIND_IGNORE) \
+	find $(srctree)/* $(RCS_FIND_IGNORE) \
 		-name '*.[hcS]' -type f -print | sort \
 		| xargs $(PERL) -w $(srctree)/scripts/checkversion.pl

-- 
1.7.5.rc1



--------------030901050809030307090803
Content-Type: text/plain;
	name="kbuild-make-versioncheck-work-in-KBUILD_OUTDIR.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="kbuild-make-versioncheck-work-in-KBUILD_OUTDIR.patch"

From 8b647ee346014ed4148ffd1887b30eb6f740f29b Mon Sep 17 00:00:00 2001
From: Peter Foley <pefoley2@verizon.net>
Date: Tue, 26 Apr 2011 17:19:28 -0400
Subject: [PATCH 4/4] kbuild: make versioncheck work in KBUILD_OUTDIR


Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index bfa0e90..56971f9 100644
--- a/Makefile
+++ b/Makefile
@@ -1401,7 +1401,7 @@ includecheck:
 		| xargs $(PERL) -w $(srctree)/scripts/checkincludes.pl
 
 versioncheck:
-	find * $(RCS_FIND_IGNORE) \
+	find $(srctree)/* $(RCS_FIND_IGNORE) \
 		-name '*.[hcS]' -type f -print | sort \
 		| xargs $(PERL) -w $(srctree)/scripts/checkversion.pl
 
-- 
1.7.5.rc1



--------------030901050809030307090803--
