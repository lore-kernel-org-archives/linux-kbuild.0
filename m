Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:54526
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751595AbdGQVqx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Jul 2017 17:46:53 -0400
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: [PATCH v2 1/8] docs: Makefile: remove no-ops targets
Date: Mon, 17 Jul 2017 18:46:35 -0300
Message-Id: <8ff84b2654333dee56681b63d8e413babc13dba0.1500327282.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1500327282.git.mchehab@s-opensource.com>
References: <cover.1500327282.git.mchehab@s-opensource.com>
MIME-Version: 1.0
In-Reply-To: <cover.1500327282.git.mchehab@s-opensource.com>
References: <cover.1500327282.git.mchehab@s-opensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Harry Wei <harryxiyou@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@zh-kernel.org, linux-kbuild@vger.kernel.org

After removal of DocBook, those targets are bogus.

Reported-by: Jim Davis <jim.epost@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/Makefile                 | 10 ----------
 Documentation/translations/zh_CN/HOWTO |  2 --
 Makefile                               |  2 +-
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index a42320385df3..d75c00e3aadb 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -95,16 +95,6 @@ endif # HAVE_SPHINX
 # The following targets are independent of HAVE_SPHINX, and the rules should
 # work or silently pass without Sphinx.
 
-# no-ops for the Sphinx toolchain
-sgmldocs:
-	@:
-psdocs:
-	@:
-mandocs:
-	@:
-installmandocs:
-	@:
-
 cleandocs:
 	$(Q)rm -rf $(BUILDDIR)
 	$(Q)$(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/media clean
diff --git a/Documentation/translations/zh_CN/HOWTO b/Documentation/translations/zh_CN/HOWTO
index 11be075ba5fa..5f6d09edc9ac 100644
--- a/Documentation/translations/zh_CN/HOWTO
+++ b/Documentation/translations/zh_CN/HOWTO
@@ -149,9 +149,7 @@ Linux内核代码中包含有大量的文档。这些文档对于学习如何与
 核源码的主目录中使用以下不同命令将会分别生成PDF、Postscript、HTML和手册
 页等不同格式的文档：
     make pdfdocs
-    make psdocs
     make htmldocs
-    make mandocs
 
 
 如何成为内核开发者
diff --git a/Makefile b/Makefile
index b4fb9a1d1594..8b7237a0d66a 100644
--- a/Makefile
+++ b/Makefile
@@ -1467,7 +1467,7 @@ $(help-board-dirs): help-%:
 
 # Documentation targets
 # ---------------------------------------------------------------------------
-DOC_TARGETS := xmldocs sgmldocs psdocs latexdocs pdfdocs htmldocs mandocs installmandocs epubdocs cleandocs linkcheckdocs
+DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs linkcheckdocs
 PHONY += $(DOC_TARGETS)
 $(DOC_TARGETS): scripts_basic FORCE
 	$(Q)$(MAKE) $(build)=Documentation $@
-- 
2.13.3

