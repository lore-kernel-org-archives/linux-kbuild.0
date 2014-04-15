Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:59392 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752800AbaDOMDt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Apr 2014 08:03:49 -0400
Received: by mail-lb0-f175.google.com with SMTP id w7so6697579lbi.20
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Apr 2014 05:03:48 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [PATCH] builddeb: clean up the linux-headers package by using tar exclude option
Date: Tue, 15 Apr 2014 15:03:44 +0300
Message-Id: <1397563424-10134-1-git-send-email-fathi.boudra@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, Ben Hutchings <ben@decadent.org.uk>, Maximilian Attems <maks@debian.org>, Fathi Boudra <fathi.boudra@linaro.org>

 Use tar --exclude option to clean up the kernel headers package
 (linux-headers) from unecessary files.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 scripts/package/builddeb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f46e4dd..f5ac45d 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -293,8 +293,9 @@ fi
 (cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
-(cd $srctree; tar -c -f - -T "$objtree/debian/hdrsrcfiles") | (cd $destdir; tar -xf -)
-(cd $objtree; tar -c -f - -T "$objtree/debian/hdrobjfiles") | (cd $destdir; tar -xf -)
+excludes="--exclude-vcs --exclude=*.cmd --exclude=*.o --exclude=Documentation"
+(cd $srctree; tar $excludes -cf - -T "$objtree/debian/hdrsrcfiles") | (cd $destdir; tar -xf -)
+(cd $objtree; tar $excludes -cf - -T "$objtree/debian/hdrobjfiles") | (cd $destdir; tar -xf -)
 (cd $objtree; cp $KCONFIG_CONFIG $destdir/.config) # copy .config manually to be where it's expected to be
 ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/modules/$version/build"
 rm -f "$objtree/debian/hdrsrcfiles" "$objtree/debian/hdrobjfiles"
-- 
1.9.1

