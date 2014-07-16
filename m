Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:47571 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759146AbaGPHMi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Jul 2014 03:12:38 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH v3 1/5] kbuild: fix a typo in scripts/Makefile.host
Date: Wed, 16 Jul 2014 16:12:19 +0900
Message-Id: <1405494743-29566-2-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1405494743-29566-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1405494743-29566-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Masahiro Yamada <yamada.m@jp.panasonic.com>

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---

Changes in v3: None
Changes in v2: None

 scripts/Makefile.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 6689364..395a240 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -44,7 +44,7 @@ host-cmulti	:= $(foreach m,$(__hostprogs),\
 host-cobjs	:= $(sort $(foreach m,$(__hostprogs),$($(m)-objs)))
 
 # C++ code
-# C++ executables compiled from at least on .cc file
+# C++ executables compiled from at least one .cc file
 # and zero or more .c files
 host-cxxmulti	:= $(foreach m,$(__hostprogs),$(if $($(m)-cxxobjs),$(m)))
 
-- 
1.9.1

