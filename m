Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:54910 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751275AbZHSJjX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Aug 2009 05:39:23 -0400
Date: Wed, 19 Aug 2009 17:38:54 +0800
From: Alek Du <alek.du@intel.com>
Subject: [PATCH] Makefile: Fix size_append issue for bzip2/lzma kernel
Message-ID: <20090819173854.2250758f@dxy.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

From 6d755cbd7a136a4314f6976275aaa6c9d10bf3e4 Mon Sep 17 00:00:00 2001
From: Alek Du <alek.du@intel.com>
Date: Wed, 19 Aug 2009 17:18:39 +0800
Subject: [PATCH] Makefile: Fix size_append issue for bzip2/lzma kernel

The Makefile.lib will call "echo -ne" to append uncompressed kernel size to
bzip2/lzma kernel image. The "echo" here depends on the shell that /bin/sh pointing
to. On Ubuntu system, the /bin/sh is pointing to dash, which does not support
"echo -e" at all. Use /bin/echo instead of shell echo should always be safe.

Signed-off-by: Alek Du <alek.du@intel.com>
---
 scripts/Makefile.lib |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 7a77787..c63c941 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -208,7 +208,7 @@ cmd_gzip = (cat $(filter-out FORCE,$^) | gzip -f -9 > $@) || \
 
 # Bzip2 and LZMA do not include size in file... so we have to fake that;
 # append the size as a 32-bit littleendian number as gzip does.
-size_append = echo -ne $(shell						\
+size_append = /bin/echo -ne $(shell						\
 dec_size=0;								\
 for F in $1; do								\
 	fsize=$$(stat -c "%s" $$F);					\
-- 
1.6.0.4
