Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:41836 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfCHJP0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Mar 2019 04:15:26 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] kbuild: add workaround for Debian make-kpkg
Date: Fri,  8 Mar 2019 18:13:39 +0900
Message-Id: <1552036419-924-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>, Manoj Srivastava <srivasta@debian.org>, Liz Zhang <lizzha@microsoft.com>, Lili Deng <v-lide@microsoft.com>, Manoj Srivastava <manoj.srivastava.1962@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Since commit 3812b8c5c5d5 ("kbuild: make -r/-R effective in top
Makefile for old Make versions"), make-kpkg is not working.

make-kpkg directly includes the top Makefile of Linux kernel, and
appends some debian_* targets.

  /usr/share/kernel-package/ruleset/kernel_version.mk:

    # Include the kernel makefile
    override dot-config := 1
    include Makefile
    dot-config := 1

I did not know the kernel Makefile was used in that way, and it is
hard to guarantee the behavior when the kernel Makefile is included
by another Makefile from a different project.

It looks like Debian Stretch stopped providing make-kpkg. Maybe it is
obsolete and being replaced with 'make deb-pkg' etc. but still widely
used.

This commit adds a workaround; if the top Makefile is included by
another Makefile, skip sub-make in order to make the main part visible.
'MAKEFLAGS += -rR' does not become effective for GNU Make < 4.0, but
Debian/Ubuntu is already using newer versions.

The effect of this commit:

  Debian 8 (Jessie)  : Fixed
  Debian 9 (Stretch) : make-kpkg (kernel-package) is not provided
  Ubuntu 14.04 LTS   : NOT Fixed
  Ubuntu 16.04 LTS   : Fixed
  Ubuntu 18.04 LTS   : Fixed

This commit cannot fix Ubuntu 14.04 because it installs GNU Make 3.81,
but its support will end in Apr 2019, which is before the Linux v5.1
release.

I added warning so that nobody would try to include the top Makefile.

Fixes: 3812b8c5c5d5 ("kbuild: make -r/-R effective in top Makefile for old Make versions")
Reported-by: Liz Zhang <lizzha@microsoft.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Tested-by: Lili Deng <v-lide@microsoft.com>
Cc: Manoj Srivastava <srivasta@debian.org>
---

Changes in v2:
  - Drop the unimportant comment about PowerPC

 Makefile | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Makefile b/Makefile
index 4fb8896..6039685 100644
--- a/Makefile
+++ b/Makefile
@@ -31,6 +31,16 @@ _all:
 # descending is started. They are now explicitly listed as the
 # prepare rule.
 
+# Ugly workaround for Debian make-kpkg:
+# make-kpkg directly includes the top Makefile of Linux kernel. In such a case,
+# skip sub-make to support debian_* targets in ruleset/kernel_version.mk, but
+# displays warning to discourage such abusage.
+ifneq ($(word 2, $(MAKEFILE_LIST)),)
+$(warning Do not include top Makefile of Linux Kernel)
+sub-make-done := 1
+MAKEFLAGS += -rR
+endif
+
 ifneq ($(sub-make-done),1)
 
 # Do not use make's built-in rules and variables
-- 
2.7.4
