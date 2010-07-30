Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:39530 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932314Ab0G3Snk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 Jul 2010 14:43:40 -0400
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] trivial: fix a typo in a filename
Date: Fri, 30 Jul 2010 20:43:20 +0200
Message-Id: <1280515401-13610-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: trivial@kernel.org
Cc: Michal Marek <mmarek@suse.cz>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Ingo Molnar <mingo@elte.hu>, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>, Christoph Hellwig <hch@lst.de>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 scripts/Makefile.modpost |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 8f14c81..82a2420 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -30,7 +30,7 @@
 #     - See include/linux/module.h for more details
 
 # Step 4 is solely used to allow module versioning in external modules,
-# where the CRC of each module is retrieved from the Module.symers file.
+# where the CRC of each module is retrieved from the Module.symvers file.
 
 # KBUILD_MODPOST_WARN can be set to avoid error out in case of undefined
 # symbols in the final module linking stage
-- 
1.7.1

