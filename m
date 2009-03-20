Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fk-out-0910.google.com ([209.85.128.185]:59056 "EHLO
	fk-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756189AbZCTQbo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 20 Mar 2009 12:31:44 -0400
Received: by fk-out-0910.google.com with SMTP id 18so429323fkq.5
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2009 09:31:41 -0700 (PDT)
From: Remis Lima Baima <remis.developer@googlemail.com>
Subject: [PATCH] Create the infrastructure for generic headers-UPDATE
Date: Fri, 20 Mar 2009 17:31:38 +0100
Message-Id: <1237566698-17059-1-git-send-email-remis.developer@googlemail.com>
In-Reply-To: <1237396115-28674-2-git-send-email-remis.developer@googlemail.com>
References: <1237396115-28674-2-git-send-email-remis.developer@googlemail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, Remis Lima Baima <remis.developer@googlemail.com>

This patch is an update to the patch 'Create the infrastructure for
generic headers'.

The 'make headers_install' is copying the dummy header files from
include/asm-generic to the OBJTREE/usr/include/asm-generic. But these
dummy header files are pointing to their equivalents in
include/generic/asm which were not being exported. This could cause
problems in the compilatin of some user space applications.
This patch fixes this problem by also exporting the header files from
include/generic/asm to the OBJTREE/usr/include/generic/asm.

Signed-off-by: Remis Lima Baima <remis.developer@googlemail.com>
---
 include/Kbuild                 |    1 +
 include/asm-generic/Kbuild     |   14 +-------------
 include/asm-generic/Kbuild.asm |   39 +--------------------------------------
 include/generic/asm/Kbuild     |   13 +++++++++++++
 include/generic/asm/Kbuild.asm |   38 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+), 51 deletions(-)
 create mode 100644 include/generic/asm/Kbuild
 create mode 100644 include/generic/asm/Kbuild.asm

diff --git a/include/Kbuild b/include/Kbuild
index d8c3e3c..ea577d5 100644
--- a/include/Kbuild
+++ b/include/Kbuild
@@ -2,6 +2,7 @@
 # List only non-arch directories below
 
 header-y += asm-generic/
+header-y += generic/asm/
 header-y += linux/
 header-y += sound/
 header-y += mtd/
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 4c9932a..19e654f 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -1,13 +1 @@
-header-y += errno-base.h
-header-y += errno.h
-header-y += fcntl.h
-header-y += ioctl.h
-header-y += mman.h
-header-y += poll.h
-header-y += signal.h
-header-y += statfs.h
-
-unifdef-y += int-l64.h
-unifdef-y += int-ll64.h
-unifdef-y += resource.h
-unifdef-y += siginfo.h
+include include/generic/asm/Kbuild
diff --git a/include/asm-generic/Kbuild.asm b/include/asm-generic/Kbuild.asm
index 70d1855..447ce16 100644
--- a/include/asm-generic/Kbuild.asm
+++ b/include/asm-generic/Kbuild.asm
@@ -1,38 +1 @@
-ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/include/asm/kvm.h \
-      		  $(srctree)/include/asm-$(SRCARCH)/kvm.h),)
-header-y  += kvm.h
-endif
-
-ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/include/asm/a.out.h \
-      		  $(srctree)/include/asm-$(SRCARCH)/a.out.h),)
-unifdef-y += a.out.h
-endif
-unifdef-y += auxvec.h
-unifdef-y += byteorder.h
-unifdef-y += errno.h
-unifdef-y += fcntl.h
-unifdef-y += ioctl.h
-unifdef-y += ioctls.h
-unifdef-y += ipcbuf.h
-unifdef-y += mman.h
-unifdef-y += msgbuf.h
-unifdef-y += param.h
-unifdef-y += poll.h
-unifdef-y += posix_types.h
-unifdef-y += ptrace.h
-unifdef-y += resource.h
-unifdef-y += sembuf.h
-unifdef-y += setup.h
-unifdef-y += shmbuf.h
-unifdef-y += sigcontext.h
-unifdef-y += siginfo.h
-unifdef-y += signal.h
-unifdef-y += socket.h
-unifdef-y += sockios.h
-unifdef-y += stat.h
-unifdef-y += statfs.h
-unifdef-y += swab.h
-unifdef-y += termbits.h
-unifdef-y += termios.h
-unifdef-y += types.h
-unifdef-y += unistd.h
+include include/generic/asm/Kbuild.asm
diff --git a/include/generic/asm/Kbuild b/include/generic/asm/Kbuild
new file mode 100644
index 0000000..4c9932a
--- /dev/null
+++ b/include/generic/asm/Kbuild
@@ -0,0 +1,13 @@
+header-y += errno-base.h
+header-y += errno.h
+header-y += fcntl.h
+header-y += ioctl.h
+header-y += mman.h
+header-y += poll.h
+header-y += signal.h
+header-y += statfs.h
+
+unifdef-y += int-l64.h
+unifdef-y += int-ll64.h
+unifdef-y += resource.h
+unifdef-y += siginfo.h
diff --git a/include/generic/asm/Kbuild.asm b/include/generic/asm/Kbuild.asm
new file mode 100644
index 0000000..70d1855
--- /dev/null
+++ b/include/generic/asm/Kbuild.asm
@@ -0,0 +1,38 @@
+ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/include/asm/kvm.h \
+      		  $(srctree)/include/asm-$(SRCARCH)/kvm.h),)
+header-y  += kvm.h
+endif
+
+ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/include/asm/a.out.h \
+      		  $(srctree)/include/asm-$(SRCARCH)/a.out.h),)
+unifdef-y += a.out.h
+endif
+unifdef-y += auxvec.h
+unifdef-y += byteorder.h
+unifdef-y += errno.h
+unifdef-y += fcntl.h
+unifdef-y += ioctl.h
+unifdef-y += ioctls.h
+unifdef-y += ipcbuf.h
+unifdef-y += mman.h
+unifdef-y += msgbuf.h
+unifdef-y += param.h
+unifdef-y += poll.h
+unifdef-y += posix_types.h
+unifdef-y += ptrace.h
+unifdef-y += resource.h
+unifdef-y += sembuf.h
+unifdef-y += setup.h
+unifdef-y += shmbuf.h
+unifdef-y += sigcontext.h
+unifdef-y += siginfo.h
+unifdef-y += signal.h
+unifdef-y += socket.h
+unifdef-y += sockios.h
+unifdef-y += stat.h
+unifdef-y += statfs.h
+unifdef-y += swab.h
+unifdef-y += termbits.h
+unifdef-y += termios.h
+unifdef-y += types.h
+unifdef-y += unistd.h
-- 
1.5.6.3

