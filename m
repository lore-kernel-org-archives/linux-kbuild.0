Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:50488 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753962AbcICT7E (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 3 Sep 2016 15:59:04 -0400
From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH] kbuild/builddeb: Fix !CONFIG_GCC_PLUGINS build
Date: Sat,  3 Sep 2016 21:58:50 +0200
Message-Id: <1472932730-1098-1-git-send-email-bp@alien8.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-kbuild@vger.kernel.org, Emese Revfy <re.emese@gmail.com>, Michal Marek <mmarek@suse.com>

From: Borislav Petkov <bp@suse.de>

When building a bindeb-pkg target into an object output dir, i.e., O=, I
get:

  find: `scripts/gcc-plugins': No such file or directory
  /mnt/kernel/kernel/linux-2.6/scripts/package/Makefile:97: recipe for target 'bindeb-pkg' failed
  make[3]: *** [bindeb-pkg] Error 1
  /mnt/kernel/kernel/linux-2.6/Makefile:1310: recipe for target 'bindeb-pkg' failed
  ...

Check whether CONFIG_GCC_PLUGINS is enabled before collecting .so plugin
names.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Emese Revfy <re.emese@gmail.com>
Cc: Michal Marek <mmarek@suse.com>
---
 scripts/package/builddeb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index e1c09e2f9be7..2e5b5f582365 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -332,7 +332,11 @@ if grep -q '^CONFIG_STACK_VALIDATION=y' $KCONFIG_CONFIG ; then
 	(cd $objtree; find tools/objtool -type f -executable) >> "$objtree/debian/hdrobjfiles"
 fi
 (cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f) >> "$objtree/debian/hdrobjfiles"
-(cd $objtree; find scripts/gcc-plugins -name \*.so -o -name gcc-common.h) >> "$objtree/debian/hdrobjfiles"
+
+if grep -q '^CONFIG_GCC_PLUGINS=y' $KCONFIG_CONFIG ; then
+	(cd $objtree; find scripts/gcc-plugins -name \*.so -o -name gcc-common.h) >> "$objtree/debian/hdrobjfiles"
+fi
+
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
 (cd $srctree; tar -c -f - -T -) < "$objtree/debian/hdrsrcfiles" | (cd $destdir; tar -xf -)
-- 
2.7.3

