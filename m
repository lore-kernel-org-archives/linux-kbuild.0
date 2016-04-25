Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:54124 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932937AbcDYQD3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Apr 2016 12:03:29 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 2/2] samples: v4l: from Documentation to samples directory
Date: Mon, 25 Apr 2016 18:03:09 +0200
Message-Id: <1461600189-2207716-3-git-send-email-arnd@arndb.de>
In-Reply-To: <1461600189-2207716-1-git-send-email-arnd@arndb.de>
References: <1461600189-2207716-1-git-send-email-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>

A small bug with the new autoksyms support showed that there are
two kernel modules in the Documentation directory that qualify
as samples, while all other samples are in the samples/ directory.

This patch was originally meant as a workaround for that bug, but
it has now been solved in a different way. However, I still think
it makes sense as a cleanup to consolidate all sample code in
one place.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/Makefile                                         | 3 +--
 Documentation/video4linux/v4l2-framework.txt                   | 2 +-
 samples/Makefile                                               | 2 +-
 {Documentation/video4linux => samples/v4l}/Makefile            | 0
 {Documentation/video4linux => samples/v4l}/v4l2-pci-skeleton.c | 0
 5 files changed, 3 insertions(+), 4 deletions(-)
 rename {Documentation/video4linux => samples/v4l}/Makefile (100%)
 rename {Documentation/video4linux => samples/v4l}/v4l2-pci-skeleton.c (100%)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 13b5ae1b87aa..de955e151af8 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -1,4 +1,3 @@
 subdir-y := accounting auxdisplay blackfin \
 	filesystems filesystems ia64 laptops mic misc-devices \
-	networking pcmcia prctl ptp timers vDSO video4linux \
-	watchdog
+	networking pcmcia prctl ptp timers vDSO watchdog
diff --git a/Documentation/video4linux/v4l2-framework.txt b/Documentation/video4linux/v4l2-framework.txt
index fa41608ab2b4..cbefc7902f5f 100644
--- a/Documentation/video4linux/v4l2-framework.txt
+++ b/Documentation/video4linux/v4l2-framework.txt
@@ -35,7 +35,7 @@ need and this same framework should make it much easier to refactor
 common code into utility functions shared by all drivers.
 
 A good example to look at as a reference is the v4l2-pci-skeleton.c
-source that is available in this directory. It is a skeleton driver for
+source that is available in samples/v4l/. It is a skeleton driver for
 a PCI capture card, and demonstrates how to use the V4L2 driver
 framework. It can be used as a template for real PCI video capture driver.
 
diff --git a/samples/Makefile b/samples/Makefile
index 594ef7d9fa2a..2e3b523d7097 100644
--- a/samples/Makefile
+++ b/samples/Makefile
@@ -2,4 +2,4 @@
 
 obj-$(CONFIG_SAMPLES)	+= kobject/ kprobes/ trace_events/ livepatch/ \
 			   hw_breakpoint/ kfifo/ kdb/ hidraw/ rpmsg/ seccomp/ \
-			   configfs/ connector/
+			   configfs/ connector/ v4l/
diff --git a/Documentation/video4linux/Makefile b/samples/v4l/Makefile
similarity index 100%
rename from Documentation/video4linux/Makefile
rename to samples/v4l/Makefile
diff --git a/Documentation/video4linux/v4l2-pci-skeleton.c b/samples/v4l/v4l2-pci-skeleton.c
similarity index 100%
rename from Documentation/video4linux/v4l2-pci-skeleton.c
rename to samples/v4l/v4l2-pci-skeleton.c
-- 
2.7.0

