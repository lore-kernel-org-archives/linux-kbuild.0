Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:39488 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932091Ab1DZVod (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2011 17:44:33 -0400
Message-ID: <4DB73C94.1020701@verizon.net>
Date: Tue, 26 Apr 2011 17:43:48 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: [PATCH 1/4] kbuild: add targets to PHONY
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

This patch adds some targets to PHONY
so they are built even if a file with the same name exists.

Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 Makefile |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index b967b96..2a5159a 100644
--- a/Makefile
+++ b/Makefile
@@ -1392,6 +1392,8 @@ tags TAGS cscope gtags: FORCE
 # Scripts to check various things for consistency
 # ---------------------------------------------------------------------------
 +PHONY += includecheck versioncheck coccicheck namespacecheck export_report
+
 includecheck:
 	find * $(RCS_FIND_IGNORE) \
 		-name '*.[hcS]' -type f -print | sort \
-- 
1.7.5.rc1

