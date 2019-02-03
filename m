Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:9690 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727289AbfBCIt1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 Feb 2019 03:49:27 -0500
From: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
Subject: [PATCH v2] kbuild: gitignore output directory
Date: Sun,  3 Feb 2019 10:48:40 +0200
Message-Id: <20190203084840.6113-1-vladimir.kondratiev@intel.com>
In-Reply-To: <CAK7LNAS8g3g3OTtqTN8begMxzbSS82Wn0CqY8u6vuELEZaLo3g@mail.gmail.com>
References: <CAK7LNAS8g3g3OTtqTN8begMxzbSS82Wn0CqY8u6vuELEZaLo3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

From: Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>

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
index 141653226f3c..b1d651e822b1 100644
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
+	$(Q){ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
 endif
 
 ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
-- 
2.19.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
