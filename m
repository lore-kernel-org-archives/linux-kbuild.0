Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:33145 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753102Ab3FZXTw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 26 Jun 2013 19:19:52 -0400
Received: by mail-wi0-f171.google.com with SMTP id hj3so2531843wib.10
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Jun 2013 16:19:51 -0700 (PDT)
Message-ID: <51CB7713.7020901@gmail.com>
Date: Thu, 27 Jun 2013 01:19:47 +0200
From: Gabriel de Perthuis <g2p.code@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] scripts: Use RCS_FIND_IGNORE in more places
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Signed-off-by: Gabriel de Perthuis <g2p.code@gmail.com>
---
 Makefile                       | 4 ++--
 scripts/checkkconfigsymbols.sh | 4 ++--
 scripts/package/builddeb       | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 9040016..9981504 100644
--- a/Makefile
+++ b/Makefile
@@ -403,12 +403,12 @@ export KBUILD_ARFLAGS
 # even be read-only.
 export MODVERDIR := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/).tmp_versions
 
 # Files to ignore in find ... statements
 
-RCS_FIND_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS \
-		   -o -name .pc -o -name .hg -o -name .git \) -prune -o
+export RCS_FIND_IGNORE := ( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS \
+		   -o -name .pc -o -name .hg -o -name .git ) -prune -o
 export RCS_TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn \
 			 --exclude CVS --exclude .pc --exclude .hg --exclude .git
 
 # ===========================================================================
 # Rules shared between *config targets and build targets
diff --git a/scripts/checkkconfigsymbols.sh b/scripts/checkkconfigsymbols.sh
index 2ca49bb..dbfd125 100755
--- a/scripts/checkkconfigsymbols.sh
+++ b/scripts/checkkconfigsymbols.sh
@@ -5,14 +5,14 @@
 # Tested with dash.
 paths="$@"
 [ -z "$paths" ] && paths=.
 
 # Doing this once at the beginning saves a lot of time, on a cache-hot tree.
-Kconfigs="`find . -name 'Kconfig' -o -name 'Kconfig*[^~]'`"
+Kconfigs="`find . $RCS_FIND_IGNORE \( -name 'Kconfig' -o -name 'Kconfig*[^~]' \) -print`"
 
 /bin/echo -e "File list \tundefined symbol used"
-find $paths -name '*.[chS]' -o -name 'Makefile' -o -name 'Makefile*[^~]'| while read i
+find $paths $RCS_FIND_IGNORE \( -name '*.[chS]' -o -name 'Makefile' -o -name 'Makefile*[^~]' \)| while read i
 do
 	# Output the bare Kconfig variable and the filename; the _MODULE part at
 	# the end is not removed here (would need perl an not-hungry regexp for that).
 	sed -ne 's!^.*\<\(UML_\)\?CONFIG_\([0-9A-Za-z_]\+\).*!\2 '$i'!p' < $i
 done | \
diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index acb8650..86fcb70 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -16,11 +16,11 @@ create_package() {
 	local pname="$1" pdir="$2"
 
 	cp debian/copyright "$pdir/usr/share/doc/$pname/"
 	cp debian/changelog "$pdir/usr/share/doc/$pname/changelog.Debian"
 	gzip -9 "$pdir/usr/share/doc/$pname/changelog.Debian"
-	sh -c "cd '$pdir'; find . -type f ! -path './DEBIAN/*' -printf '%P\0' \
+	sh -c "cd '$pdir'; find . \$RCS_FIND_IGNORE -type f ! -path './DEBIAN/*' -printf '%P\0' \
 		| xargs -r0 md5sum > DEBIAN/md5sums"
 
 	# Fix ownership and permissions
 	chown -R root:root "$pdir"
 	chmod -R go-w "$pdir"
@@ -241,13 +241,13 @@ Description: Linux kernel, version $version
 EOF
 
 fi
 
 # Build header package
-(cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl > "$objtree/debian/hdrsrcfiles")
-(cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$objtree/debian/hdrsrcfiles")
-(cd $objtree; find arch/$SRCARCH/include .config Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
+(cd $srctree; find . $RCS_FIND_IGNORE \( -name Makefile\* -o -name Kconfig\* -o -name \*.pl \) -print > "$objtree/debian/hdrsrcfiles")
+(cd $srctree; find arch/$SRCARCH/include include scripts $RCS_FIND_IGNORE -type f -print >> "$objtree/debian/hdrsrcfiles")
+(cd $objtree; find arch/$SRCARCH/include .config Module.symvers include scripts $RCS_FIND_IGNORE -type f -print >> "$objtree/debian/hdrobjfiles")
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
 (cd $srctree; tar -c -f - -T "$objtree/debian/hdrsrcfiles") | (cd $destdir; tar -xf -)
 (cd $objtree; tar -c -f - -T "$objtree/debian/hdrobjfiles") | (cd $destdir; tar -xf -)
 ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/modules/$version/build"
-- 
1.8.3.1.588.gb04834f

