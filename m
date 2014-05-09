Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44010 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756319AbaEIMwn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 May 2014 08:52:43 -0400
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH v2 5/5] kbuild: Use relative path when building in a subdir of the source tree
Date: Fri,  9 May 2014 14:52:24 +0200
Message-Id: <1399639944-20551-6-git-send-email-mmarek@suse.cz>
In-Reply-To: <1399639944-20551-1-git-send-email-mmarek@suse.cz>
References: <1399639944-20551-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

When doing make O=<subdir>, use '..' to refer to the source tree. This
allows for more readable compiler messages, and, more importantly, it
sets the VPATH to '..', so filenames in WARN_ON() etc. will be shorter.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Michal Marek <mmarek@suse.cz>
---
v1->v2: No changes

 Makefile | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 4da1c4b..9872c53 100644
--- a/Makefile
+++ b/Makefile
@@ -153,7 +153,17 @@ else
 _all: modules
 endif
 
-srctree		:= $(if $(KBUILD_SRC),$(KBUILD_SRC),.)
+ifeq ($(KBUILD_SRC),)
+        # building in the source tree
+        srctree := .
+else
+        ifeq ($(KBUILD_SRC)/,$(dir $(CURDIR)))
+                # building in a subdirectory of the source tree
+                srctree := ..
+        else
+                srctree := $(KBUILD_SRC)
+        endif
+endif
 objtree		:= .
 src		:= $(srctree)
 obj		:= $(objtree)
-- 
1.8.4.5

