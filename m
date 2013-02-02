Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ra.se.axis.com ([195.60.68.13]:50249 "EHLO ra.se.axis.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755706Ab3BBK2Z (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Feb 2013 05:28:25 -0500
Date: Sat, 2 Feb 2013 11:18:35 +0100
From: Jesper Nilsson <jesper.nilsson@axis.com>
Subject: [PATCH] kbuild: Fix destination-y for installed headers
Message-ID: <20130202101835.GY23529@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, David Howells <dhowells@redhat.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jespern@axis.com

Commit 10b63956fce7f369cc37fd4d994f09bd5203efe4 which plumbed in UAPI
broke the destination-y functionality of scripts/Makefile.headersinst.

The variable destination-y is used in a := assignment and so is expanded at
declaration time, and the include of the Kbuild fragments that set
destination-y to something is after this time, so it now always expands empty.

There are no in-tree users of destination-y, but it allows any
Kbuild-fragment to redirect where headers are installed.

Just move the assignment of the variable that uses it below the include
of the Kbuild fragment.

Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Michal Marek <mmarek@suse.cz>
Cc: David Howells <dhowells@redhat.com>
---
 Makefile.headersinst |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git scripts/Makefile.headersinst scripts/Makefile.headersinst
index 06ba4a7..25f216a 100644
--- scripts/Makefile.headersinst
+++ scripts/Makefile.headersinst
@@ -7,15 +7,15 @@
 #
 # ==========================================================================
 
-# called may set destination dir (when installing to asm/)
-_dst := $(or $(destination-y),$(dst),$(obj))
-
 # generated header directory
 gen := $(if $(gen),$(gen),$(subst include/,include/generated/,$(obj)))
 
 kbuild-file := $(srctree)/$(obj)/Kbuild
 include $(kbuild-file)
 
+# called may set destination dir (when installing to asm/)
+_dst := $(or $(destination-y),$(dst),$(obj))
+
 old-kbuild-file := $(srctree)/$(subst uapi/,,$(obj))/Kbuild
 ifneq ($(wildcard $(old-kbuild-file)),)
 include $(old-kbuild-file)



/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
