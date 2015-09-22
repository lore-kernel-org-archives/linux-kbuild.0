Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:35856 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932490AbbIVSgv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:51 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 20/39] Port xconfig to Qt5 - Remove Qt3Support from Makefile.
Date: Tue, 22 Sep 2015 11:36:20 -0700
Message-Id: <1442946999-37018-21-git-send-email-thiago.macieira@intel.com>
In-Reply-To: <1442946999-37018-1-git-send-email-thiago.macieira@intel.com>
References: <1442946999-37018-1-git-send-email-thiago.macieira@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>, Boris Barbulovski <bbarbulovski@gmail.com>

From: Boris Barbulovski <bbarbulovski@gmail.com>

Signed-off-by: Boris Barbulovski <bbarbulovski@gmail.com>
Signed-off-by: Thiago Macieira <thiago.macieira@intel.com>
---
 scripts/kconfig/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index aceaaed..9b5b8c6 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -265,8 +265,8 @@ $(obj)/.tmp_qtcheck:
 	      moc="/usr/bin/moc"; \
 	    fi; \
 	else \
-	  cflags="\$$(shell pkg-config QtCore QtGui Qt3Support --cflags)"; \
-	  libs="\$$(shell pkg-config QtCore QtGui Qt3Support --libs)"; \
+	  cflags="\$$(shell pkg-config QtCore QtGui --cflags)"; \
+	  libs="\$$(shell pkg-config QtCore QtGui --libs)"; \
 	  moc="\$$(shell pkg-config QtCore --variable=moc_location)"; \
 	  [ -n "$$moc" ] || moc="\$$(shell pkg-config QtCore --variable=prefix)/bin/moc"; \
 	fi; \
-- 
2.1.4

