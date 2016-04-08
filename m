Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:34716 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752047AbcDHJQE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Apr 2016 05:16:04 -0400
From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] tools: Use builtin $(abspath ...) instead of $(shell cd ... && pwd)
Date: Fri,  8 Apr 2016 11:15:59 +0200
Message-Id: <1460106959-6684-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Avoid forking off a shell to resolve the absolute path of the output
directory when make's builtin $(abspath ...) function will do an
adequate job.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Makefile                       | 4 ++--
 tools/scripts/Makefile.include | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 173437debc87..c1e3ece3684f 100644
--- a/Makefile
+++ b/Makefile
@@ -1542,11 +1542,11 @@ image_name:
 # Clear a bunch of variables before executing the submake
 tools/: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(shell cd $(objtree) && /bin/pwd) subdir=tools -C $(src)/tools/
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(src)/tools/
 
 tools/%: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(shell cd $(objtree) && /bin/pwd) subdir=tools -C $(src)/tools/ $*
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(src)/tools/ $*
 
 # Single targets
 # ---------------------------------------------------------------------------
diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 5467da41dc72..4d34d0729ac9 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -1,7 +1,7 @@
 ifneq ($(O),)
 ifeq ($(origin O), command line)
 	dummy := $(if $(shell test -d $(O) || echo $(O)),$(error O=$(O) does not exist),)
-	ABSOLUTE_O := $(shell cd $(O) ; pwd)
+	ABSOLUTE_O := $(abspath $(O))
 	OUTPUT := $(ABSOLUTE_O)/$(if $(subdir),$(subdir)/)
 	COMMAND_O := O=$(ABSOLUTE_O)
 ifeq ($(objtree),)
-- 
2.8.0

