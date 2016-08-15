Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:35214 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752856AbcHORgZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 15 Aug 2016 13:36:25 -0400
Received: by mail-pa0-f43.google.com with SMTP id i5so17898719pat.2
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Aug 2016 10:36:25 -0700 (PDT)
Date: Mon, 15 Aug 2016 10:36:22 -0700
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH] builddeb: Skip gcc-plugins when not configured
Message-ID: <20160815173622.GA24820@www.outflux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Frank Paulsen <frobnic+lkml@gmail.com>, Christian Kujau <lists@nerdbynature.de>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

When attempting to build a Debian kernel package, the "scripts/gcc-plugins"
directory does not exist in the output tree unless CONFIG_GCC_PLUGINS=y.
To avoid errors when not defined, this wraps the failing "find" in a config
test.

Reported-by: Frank Paulsen <frobnic+lkml@gmail.com>
Tested-by: Christian Kujau <lists@nerdbynature.de>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
This should go into v4.8...
---
 scripts/package/builddeb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index e1c09e2f9be7..8ea9fd2b6573 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -332,7 +332,9 @@ if grep -q '^CONFIG_STACK_VALIDATION=y' $KCONFIG_CONFIG ; then
 	(cd $objtree; find tools/objtool -type f -executable) >> "$objtree/debian/hdrobjfiles"
 fi
 (cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f) >> "$objtree/debian/hdrobjfiles"
-(cd $objtree; find scripts/gcc-plugins -name \*.so -o -name gcc-common.h) >> "$objtree/debian/hdrobjfiles"
+if grep -q '^CONFIG_GCC_PLUGINS=y' $KCONFIG_CONFIG ; then
+	(cd $objtree; find scripts/gcc-plugins -name \*.so -o -name gcc-common.h) >> "$objtree/debian/hdrobjfiles"
+fi
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
 (cd $srctree; tar -c -f - -T -) < "$objtree/debian/hdrsrcfiles" | (cd $destdir; tar -xf -)
-- 
2.7.4


-- 
Kees Cook
Nexus Security
