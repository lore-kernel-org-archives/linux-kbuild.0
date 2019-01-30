Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:11612 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726548AbfA3LPN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Jan 2019 06:15:13 -0500
From: Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>
Subject: [PATCH] kbuild: gitignore output directory
Date: Wed, 30 Jan 2019 13:14:47 +0200
Message-Id: <20190130111447.26032-1-vladimir.kondratiev@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

When compiling into output directory using O=, many files
created under KBUILD_OUTPUT that git considers
as new ones; git clients, ex. "git gui" lists it, and it clutters
file list making it difficult to see what was really changed

Generate .gitignore in output directory that ignores all
its content

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 141653226f3c..ee66ea28869b 100644
--- a/Makefile
+++ b/Makefile
@@ -483,10 +483,13 @@ PHONY += outputmakefile
 # outputmakefile generates a Makefile in the output directory, if using a
 # separate output directory. This allows convenient use of make in the
 # output directory.
+# At the same time when output Makefile generated, generate .gitignore to
+# ignore whole output directory
 outputmakefile:
 ifneq ($(KBUILD_SRC),)
 	$(Q)ln -fsn $(srctree) source
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkmakefile $(srctree)
+	echo "# this is build directory, ignore it\n*" > .gitignore
 endif
 
 ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
-- 
2.19.1
