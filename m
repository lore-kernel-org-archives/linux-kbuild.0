Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from quartz.orcorp.ca ([184.70.90.242]:52338 "EHLO quartz.orcorp.ca"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751553Ab2I3XtX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 30 Sep 2012 19:49:23 -0400
Date: Sun, 30 Sep 2012 17:20:05 -0600
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: [PATCH] [KBUILD] Put the CROSS_COMPILE and ARCH variables in the
 build directory makefile
Message-ID: <20120930232005.GB30637@obsidianresearch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

To make cross building a little simpler. The usage with mini-config would
be something like:

$ mkdir build
$ make ARCH=arm CROSS_COMPILE=arm-v5te-linux-gnueabi- \
       KCONFIG_ALLCONFIG=mini.config O=build allnoconfig
$ make -C build/

After configuring subsequent builds do not need to specify the cross
options.

Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
---
 scripts/mkmakefile |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/scripts/mkmakefile b/scripts/mkmakefile
index 0cc0442..7cdc3fb 100644
--- a/scripts/mkmakefile
+++ b/scripts/mkmakefile
@@ -56,4 +56,9 @@ Makefile:;
 
 %/: all
 	@:
+
+CROSS_COMPILE?=${CROSS_COMPILE:-}
+${CROSS_COMPILE:+export CROSS_COMPILE}
+ARCH?=${ARCH:-}
+${ARCH:+export ARCH}
 EOF
-- 
1.7.4.1

