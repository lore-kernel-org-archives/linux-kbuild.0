Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:39552 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932954Ab1DZVot (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2011 17:44:49 -0400
Message-ID: <4DB73CA6.4030502@verizon.net>
Date: Tue, 26 Apr 2011 17:44:06 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: [PATCH 4/4] kbuild: make versioncheckcheck work in KBUILD_OUTDIR
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

This patch fixes the versioncheck target so it works when make is invoked in KBUILD_OUTDIR.

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
 -- 1.7.5.rc1

