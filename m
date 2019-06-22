Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:25247 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbfFVHv1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Jun 2019 03:51:27 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: fix a warning in double cleaning of separate build directory
Date: Sat, 22 Jun 2019 16:51:00 +0900
Message-Id: <20190622075100.17990-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Since commit b91976b7c0e3 ("kbuild: compile-test UAPI headers to ensure
they are self-contained"), 'make clean' in a row for the separate output
directory emits a warning.

$ make -s O=foo allmodconfig; cd foo; make usr/; make clean; make clean
  [ snip ]
  CLEAN   .
  CLEAN   usr/include/asm usr/include/asm-generic usr/include/drm usr/include/linux usr/include/misc usr/include/mtd usr/include/rdma usr/include/scsi usr/include/sound usr/include/video usr/include/xen
  CLEAN   usr
  CLEAN   arch/x86/tools
  CLEAN   .tmp_versions
find: ‘*’: No such file or directory
find: ‘*’: No such file or directory

In the second 'make clean', $(objtree)/usr/include exists, but it
contains nothing, then the 'find' command warns 'No such file or
directory'.

I replaced the nasty 'find' with $(wildcard ...).

[Note]
I wish I could write the code more simply, like this:

clean-dirs = $(patsubst $(obj)/%/,%,$(wildcard $(obj)/*/))

I did not do that due to the bug of GNU Make <= 4.2.1

$(wildcard $(obj)/*/) should match to only directories since it has
a trailing slash, but actually matches to regular files too.

This bug was fixed by:

| commit b7acb10e86dc8f5fdf2a2bbd87e1059c315e31d6
| Author: spagoveanu@gmail.com <spagoveanu@gmail.com>
| Date:   Wed Jun 20 02:03:48 2018 +0300
|
|    * src/dir.c: Preserve glob d_type field

For GNU Make <= 4.2.1, clean-dirs would end up with containing
'usr/include/Makefile'. This would be harmless because Makefile.clean
would search for the non-existing 'usr/include/usr/include/Makefile',
then it would be filtered out by $(wildcard ...).

However, I'd rather try my best to avoid buggy code.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Fixes: b91976b7c0e3 ("kbuild: compile-test UAPI headers to ensure they are self-contained")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 usr/include/Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 7091e8b5a608..343abba96205 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -128,5 +128,8 @@ endif
 # Use '=' instead of ':=' to avoid $(shell ...) evaluation when cleaning
 header-test-y = $(filter-out $(no-header-test), $(all-uapi-headers))
 
-# Use '=' instead of ':=' to avoid $(shell ...) evaluation when building
-clean-dirs = $(shell cd $(obj) 2>/dev/null && find * -maxdepth 0 -type d)
+# Use '=' instead of ':=' to avoid $(wildcard ...) evaluation when building
+#
+# For GNU Make 4.2.1, $(wildcard $(obj)/*/) matches to not only directories
+# but also regular files. Use $(filter %/, ...) just in case.
+clean-dirs = $(patsubst $(obj)/%/,%,$(filter %/, $(wildcard $(obj)/*/)))
-- 
2.17.1
