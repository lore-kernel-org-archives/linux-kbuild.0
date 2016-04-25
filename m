Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:53518 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932927AbcDYQE2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Apr 2016 12:04:28 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 1/2] samples: connector: from Documentation to samples directory
Date: Mon, 25 Apr 2016 18:03:08 +0200
Message-Id: <1461600189-2207716-2-git-send-email-arnd@arndb.de>
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
 Documentation/Makefile                          | 2 +-
 Documentation/connector/connector.txt           | 8 ++++++++
 samples/Kconfig                                 | 9 +++++++++
 samples/Makefile                                | 2 +-
 {Documentation => samples}/connector/.gitignore | 0
 {Documentation => samples}/connector/Makefile   | 6 +++---
 {Documentation => samples}/connector/cn_test.c  | 0
 {Documentation => samples}/connector/ucon.c     | 0
 8 files changed, 22 insertions(+), 5 deletions(-)
 rename {Documentation => samples}/connector/.gitignore (100%)
 rename {Documentation => samples}/connector/Makefile (76%)
 rename {Documentation => samples}/connector/cn_test.c (100%)
 rename {Documentation => samples}/connector/ucon.c (100%)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 1207d7907650..13b5ae1b87aa 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -1,4 +1,4 @@
-subdir-y := accounting auxdisplay blackfin connector \
+subdir-y := accounting auxdisplay blackfin \
 	filesystems filesystems ia64 laptops mic misc-devices \
 	networking pcmcia prctl ptp timers vDSO video4linux \
 	watchdog
diff --git a/Documentation/connector/connector.txt b/Documentation/connector/connector.txt
index f6215f95149b..ab7ca897fab7 100644
--- a/Documentation/connector/connector.txt
+++ b/Documentation/connector/connector.txt
@@ -186,3 +186,11 @@ only cn_test.c test module used it.
 Some work in netlink area is still being done, so things can be changed in
 2.6.15 timeframe, if it will happen, documentation will be updated for that
 kernel.
+
+/*****************************************/
+Code samples
+/*****************************************/
+
+Sample code for a connector test module and user space can be found
+in samples/connector/. To build this code, enable CONFIG_CONNECTOR
+and CONFIG_SAMPLES.
diff --git a/samples/Kconfig b/samples/Kconfig
index d54f28c6dc5e..559a58baff6e 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -76,4 +76,13 @@ config SAMPLE_CONFIGFS
 	help
 	  Builds a sample configfs interface.
 
+config SAMPLE_CONNECTOR
+	tristate "Build connector sample -- loadable modules only"
+	depends on CONNECTOR && m
+	help
+	  When enabled, this builds both a sample kernel module for
+	  the connector interface and a user space tool to communicate
+	  with it.
+	  See also Documentation/connector/connector.txt
+
 endif # SAMPLES
diff --git a/samples/Makefile b/samples/Makefile
index 48001d7e23f0..594ef7d9fa2a 100644
--- a/samples/Makefile
+++ b/samples/Makefile
@@ -2,4 +2,4 @@
 
 obj-$(CONFIG_SAMPLES)	+= kobject/ kprobes/ trace_events/ livepatch/ \
 			   hw_breakpoint/ kfifo/ kdb/ hidraw/ rpmsg/ seccomp/ \
-			   configfs/
+			   configfs/ connector/
diff --git a/Documentation/connector/.gitignore b/samples/connector/.gitignore
similarity index 100%
rename from Documentation/connector/.gitignore
rename to samples/connector/.gitignore
diff --git a/Documentation/connector/Makefile b/samples/connector/Makefile
similarity index 76%
rename from Documentation/connector/Makefile
rename to samples/connector/Makefile
index d98e4df98e24..04b9622b6f51 100644
--- a/Documentation/connector/Makefile
+++ b/samples/connector/Makefile
@@ -1,9 +1,9 @@
-ifneq ($(CONFIG_CONNECTOR),)
-obj-m += cn_test.o
-endif
+obj-$(CONFIG_SAMPLE_CONNECTOR) += cn_test.o
 
 # List of programs to build
+ifdef CONFIG_SAMPLE_CONNECTOR
 hostprogs-y := ucon
+endif
 
 # Tell kbuild to always build the programs
 always := $(hostprogs-y)
diff --git a/Documentation/connector/cn_test.c b/samples/connector/cn_test.c
similarity index 100%
rename from Documentation/connector/cn_test.c
rename to samples/connector/cn_test.c
diff --git a/Documentation/connector/ucon.c b/samples/connector/ucon.c
similarity index 100%
rename from Documentation/connector/ucon.c
rename to samples/connector/ucon.c
-- 
2.7.0

