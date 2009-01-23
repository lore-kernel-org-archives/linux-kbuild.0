Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from byss.tchmachines.com ([208.76.80.75]:57920 "EHLO
	byss.tchmachines.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754990AbZAWBGy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Jan 2009 20:06:54 -0500
Date: Thu, 22 Jan 2009 16:16:47 -0800
From: Josh Hunt <josh@scalex86.org>
Subject: [PATCH] Add vmlinux to kernel rpm
Message-ID: <20090123001647.GB31925@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, kiran@scalex86.org

Adds compressed vmlinux to rpm when doing "make {rpm-pkg,binrpm-pkg}".
Installs vmlinux.bz2 to /boot.

Signed-off-by: Josh Hunt <josh@scalex86.org>

Index: linux-2.6.28/scripts/package/mkspec
===================================================================
--- linux-2.6.28.orig/scripts/package/mkspec    2008-12-24
15:26:37.000000000 -0800
+++ linux-2.6.28/scripts/package/mkspec    2009-01-21
16:53:03.000000000 -0800
@@ -86,6 +86,14 @@ echo "%endif"
 echo 'cp System.map $RPM_BUILD_ROOT'"/boot/System.map-$KERNELRELEASE"

 echo 'cp .config $RPM_BUILD_ROOT'"/boot/config-$KERNELRELEASE"
+
+echo "%ifnarch ppc64"
+echo 'cp vmlinux vmlinux.orig'
+echo 'bzip2 -9 vmlinux'
+echo 'mv vmlinux.bz2
$RPM_BUILD_ROOT'"/boot/vmlinux-$KERNELRELEASE.bz2"
+echo 'mv vmlinux.orig vmlinux'
+echo "%endif"
+
 echo ""
 echo "%clean"
 echo '#echo -rf $RPM_BUILD_ROOT' 
