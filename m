Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:28283 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgAYENO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jan 2020 23:13:14 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v3 4/7] builddeb: avoid invoking sub-shells where possible
Date: Sat, 25 Jan 2020 13:12:32 +0900
Message-Id: <20200125041235.8856-4-masahiroy@kernel.org>
In-Reply-To: <20200125041235.8856-1-masahiroy@kernel.org>
References: <20200125041235.8856-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>

The commands surrounded by ( ... ) is run in a sub-shell, but you do
not have to spawn a sub-shell for every single line.

Use just one ( ... ) for creating debian/hdrsrcfiles.

For tar, use -C option instead.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v3:
 - fix more misconversion

Changes in v2:
 - fix misconversion pointed out by Ben

 scripts/package/builddeb | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 15a76817e4ac..a73e0d5377e9 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -165,21 +165,30 @@ EOF
 done
 
 # Build kernel header package
-(cd $srctree; find . arch/$SRCARCH -maxdepth 1 -name Makefile\*) > debian/hdrsrcfiles
-(cd $srctree; find include scripts -type f -o -type l) >> debian/hdrsrcfiles
-(cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> debian/hdrsrcfiles
-(cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> debian/hdrsrcfiles
-if is_enabled CONFIG_STACK_VALIDATION; then
-	echo tools/objtool/objtool >> debian/hdrobjfiles
-fi
-find arch/$SRCARCH/include Module.symvers include scripts -type f >> debian/hdrobjfiles
-if is_enabled CONFIG_GCC_PLUGINS; then
-	find scripts/gcc-plugins -name \*.so >> debian/hdrobjfiles
-fi
+(
+	cd $srctree
+	find . arch/$SRCARCH -maxdepth 1 -name Makefile\*
+	find include scripts -type f -o -type l
+	find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform
+	find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f
+) > debian/hdrsrcfiles
+
+{
+	if is_enabled CONFIG_STACK_VALIDATION; then
+		echo tools/objtool/objtool
+	fi
+
+	find arch/$SRCARCH/include Module.symvers include scripts -type f
+
+	if is_enabled CONFIG_GCC_PLUGINS; then
+		find scripts/gcc-plugins -name \*.so
+	fi
+} > debian/hdrobjfiles
+
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
-(cd $srctree; tar -c -f - -T -) < debian/hdrsrcfiles | (cd $destdir; tar -xf -)
-tar -c -f - -T - < debian/hdrobjfiles | (cd $destdir; tar -xf -)
+tar -c -f - -C $srctree -T debian/hdrsrcfiles | tar -xf - -C $destdir
+tar -c -f - -T debian/hdrobjfiles | tar -xf - -C $destdir
 cp $KCONFIG_CONFIG $destdir/.config # copy .config manually to be where it's expected to be
 ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/modules/$version/build"
 rm -f debian/hdrsrcfiles debian/hdrobjfiles
-- 
2.17.1
