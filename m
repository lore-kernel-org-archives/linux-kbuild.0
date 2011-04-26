Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:39509 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932091Ab1DZVoi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2011 17:44:38 -0400
Message-ID: <4DB73C9A.8040808@verizon.net>
Date: Tue, 26 Apr 2011 17:43:54 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: [PATCH 2/4] kbuild: make headerdep work in KBUILD_OUTDIR
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

This patch fixes the headerdep target so it works when make is invoked in KBUILD_OUTDIR.

Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 2a5159a..093c9d2 100644
--- a/Makefile
+++ b/Makefile
@@ -991,7 +991,8 @@ include/generated/utsrelease.h: include/config/kernel.release FORCE
  PHONY += headerdep
 headerdep:
-	$(Q)find include/ -name '*.h' | xargs --max-args 1 scripts/headerdep.pl
+	$(Q)find $(srctree)/include/ -name '*.h' | xargs --max-args 1 \
+	$(srctree)/scripts/headerdep.pl -I$(srctree)/include
  # ---------------------------------------------------------------------------
 -- 1.7.5.rc1

