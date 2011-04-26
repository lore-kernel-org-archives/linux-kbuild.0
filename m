Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:39544 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932131Ab1DZVot (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2011 17:44:49 -0400
Message-ID: <4DB73CA0.5080902@verizon.net>
Date: Tue, 26 Apr 2011 17:44:00 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: [PATCH 3/4] kbuild: make includecheck work in KBUILD_OUTDIR
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Arnaud Lacombe <lacombar@gmail.com>, Michal Marek <mmarek@suse.cz>

This patch fixes the includecheck target so it works when make is invoked in KBUILD_OUTDIR.

Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 093c9d2..bfa0e90 100644
--- a/Makefile
+++ b/Makefile
@@ -1396,7 +1396,7 @@ tags TAGS cscope gtags: FORCE
 PHONY += includecheck versioncheck coccicheck namespacecheck export_report
  includecheck:
-	find * $(RCS_FIND_IGNORE) \
+	find $(srctree)/* $(RCS_FIND_IGNORE) \
 		-name '*.[hcS]' -type f -print | sort \
 		| xargs $(PERL) -w $(srctree)/scripts/checkincludes.pl
 -- 1.7.5.rc1

