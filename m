Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:25556 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S932987AbdIYM0t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Sep 2017 08:26:49 -0400
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: [PATCH] kbuild: drop unused symverfile in Makefile.modpost
Date: Mon, 25 Sep 2017 20:25:10 +0800
Message-ID: <1506342310-21490-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com

Since commit 040fcc819, symverfile has been replaced with kernelsymfile
and modulesymfile.

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 scripts/Makefile.modpost | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 16923ba..756d14f 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -97,7 +97,6 @@ vmlinux.o: FORCE
 	$(call cmd,kernel-mod)
 
 # Declare generated files as targets for modpost
-$(symverfile):         __modpost ;
 $(modules:.ko=.mod.c): __modpost ;
 
 
-- 
2.1.0



