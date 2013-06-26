Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:44732 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753102Ab3FZXUD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 26 Jun 2013 19:20:03 -0400
Received: by mail-wg0-f48.google.com with SMTP id f11so44158wgh.27
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Jun 2013 16:20:01 -0700 (PDT)
Message-ID: <51CB771D.7070908@gmail.com>
Date: Thu, 27 Jun 2013 01:19:57 +0200
From: Gabriel de Perthuis <g2p.code@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] scripts: Don't run find across mountpoints
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Signed-off-by: Gabriel de Perthuis <g2p.code@gmail.com>
---
 Makefile        | 2 +-
 scripts/tags.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9981504..9ac86d7 100644
--- a/Makefile
+++ b/Makefile
@@ -403,11 +403,11 @@ export KBUILD_ARFLAGS
 # even be read-only.
 export MODVERDIR := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/).tmp_versions
 
 # Files to ignore in find ... statements
 
-export RCS_FIND_IGNORE := ( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS \
+export RCS_FIND_IGNORE := -xdev ( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS \
 		   -o -name .pc -o -name .hg -o -name .git ) -prune -o
 export RCS_TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn \
 			 --exclude CVS --exclude .pc --exclude .hg --exclude .git
 
 # ===========================================================================
diff --git a/scripts/tags.sh b/scripts/tags.sh
index 74f02e4..8d0ed62 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -10,11 +10,11 @@
 if [ "$KBUILD_VERBOSE" = "1" ]; then
 	set -x
 fi
 
 # This is a duplicate of RCS_FIND_IGNORE without escaped '()'
-ignore="( -name SCCS -o -name BitKeeper -o -name .svn -o \
+ignore="-xdev ( -name SCCS -o -name BitKeeper -o -name .svn -o \
           -name CVS  -o -name .pc       -o -name .hg  -o \
           -name .git )                                   \
           -prune -o"
 
 # Do not use full path if we do not use O=.. builds
-- 
1.8.3.1.588.gb04834f

