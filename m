Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from osg.samsung.com ([64.30.133.232]:57956 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751133AbdJBXxe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Oct 2017 19:53:34 -0400
From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH] Makefile: enable dochelp run from main make level
Date: Mon,  2 Oct 2017 17:44:19 -0600
Message-Id: <20171002234421.20254-3-shuahkh@osg.samsung.com>
In-Reply-To: <20171002234421.20254-1-shuahkh@osg.samsung.com>
References: <20171002234421.20254-1-shuahkh@osg.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com, corbet@lwn.net
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Change to enable dochelp run from main make level to make it easier to
use it.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index cf007a31d575..f99d1b36c437 100644
--- a/Makefile
+++ b/Makefile
@@ -1454,7 +1454,7 @@ $(help-board-dirs): help-%:
 
 # Documentation targets
 # ---------------------------------------------------------------------------
-DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs linkcheckdocs
+DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs linkcheckdocs dochelp
 PHONY += $(DOC_TARGETS)
 $(DOC_TARGETS): scripts_basic FORCE
 	$(Q)$(MAKE) $(build)=Documentation $@
-- 
2.11.0

