Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out.selfhost.de ([82.98.82.95]:55267 "EHLO outgoing.selfhost.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753733Ab2EZPSI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 May 2012 11:18:08 -0400
Message-ID: <4FC0F29C.9050508@afaics.de>
Date: Sat, 26 May 2012 17:11:24 +0200
From: Harald Dunkel <harri@afaics.de>
MIME-Version: 1.0
Subject: [PATCH] scripts/package/builddeb: include generated header files
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

Building the linux-headers*.deb file on amd64 it seems that scripts/\
package/builddeb forgets to include some generated header files from
the build directory. It uses other header files generated in the
source directory instead.

	arch/x86/include/generated/asm/unistd_32_ia32.h
	arch/x86/include/generated/asm/unistd_64_x32.h

are lost. AFAICS this problem was introduced by
9b4ce7bce5f30712fd926ab4599a803314a07719 .

Below is a patch.

This is the very first patch I am trying to get into the kernel source
tree. Please excuse and correct me if I don't follow the blessed
procedure.

Thanx for your patience.


Harri
-----------------------------------------------------------------------------------
commit 43aa35286ac190fc64998587e54bade3e53487ef
Author: Harald Dunkel <harri@afaics.de>
Date:   Sat May 26 15:41:24 2012 +0200

    kbuild: add generated header files for 'make deb-pkg'

    9b4ce7bce5f30712fd926ab4599a803314a07719 introduced a regression: The header
    files generated in $objtree/arch/$SRCARCH/include are not included in the
    linux-headers*.deb package. This breaks building some 3rd-party modules due
    to a missing unistd_32_ia32.h file.

    Further the temporary "hdrobjfiles" list of files is not properly reset.

    This patch fixes these problem.

    Signed-off-by: Harald Dunkel <harri@afaics.de>

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index eee5f8e..1cf6352 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -245,6 +245,7 @@ fi
 # Build header package
 (cd $srctree; find . -name Makefile -o -name Kconfig\* -o -name \*.pl > "$objtree/debian/hdrsrcfiles")
 (cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$objtree/debian/hdrsrcfiles")
+(cd $objtree; find arch/$SRCARCH/include -type f -name \*.h > "$objtree/debian/hdrobjfiles")
 (cd $objtree; find .config Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
