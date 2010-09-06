Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:39544 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750885Ab0IFLtD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Sep 2010 07:49:03 -0400
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH 2/3] kbuild: Do not run make clean in $(srctree)
Date: Mon,  6 Sep 2010 13:48:15 +0200
Message-Id: <1283773696-3911-3-git-send-email-mmarek@suse.cz>
In-Reply-To: <1283773696-3911-1-git-send-email-mmarek@suse.cz>
References: <1283773696-3911-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index b98943a..d71bfde 100644
--- a/Makefile
+++ b/Makefile
@@ -1180,7 +1180,7 @@ MRPROPER_FILES += .config .config.old .version .old_version             \
 #
 clean: rm-dirs  := $(CLEAN_DIRS)
 clean: rm-files := $(CLEAN_FILES)
-clean-dirs      := $(addprefix _clean_,$(srctree) $(vmlinux-alldirs) Documentation)
+clean-dirs      := $(addprefix _clean_, . $(vmlinux-alldirs) Documentation)
 
 PHONY += $(clean-dirs) clean archclean
 $(clean-dirs):
-- 
1.7.1

