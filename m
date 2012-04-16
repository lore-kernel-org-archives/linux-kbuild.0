Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kingswood-consulting.co.uk ([88.97.16.53]:43927 "EHLO
	andromeda.kingswood-consulting.co.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753493Ab2DPMoi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Apr 2012 08:44:38 -0400
Message-ID: <4F8C12FC.4010102@kingswood-consulting.co.uk>
Date: Mon, 16 Apr 2012 13:39:24 +0100
From: Frank Kingswood <frank@kingswood-consulting.co.uk>
MIME-Version: 1.0
Subject: [PATCH] user-specified temporary directory for deb-pkg
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

The Debian package build can be very slow when running against a slow NFS 
server. This patch allows the user to set the BUILDTMP environment variable 
to move these temporaries somewhere local.

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f6cbc3d..2f9d2ee 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -74,10 +74,20 @@ if [ -n "$KDEB_PKGVERSION" ]; then
  else
         packageversion=$version-$revision
  fi
-tmpdir="$objtree/debian/tmp"
-fwdir="$objtree/debian/fwtmp"
-kernel_headers_dir="$objtree/debian/hdrtmp"
-libc_headers_dir="$objtree/debian/headertmp"
+
+if [ -n "$BUILDTMP" ] ; then
+       mkdir -p "$BUILDTMP/debian"
+       tmpdir="$BUILDTMP/debian/tmp"
+       fwdir="$BUILDTMP/debian/fwtmp"
+       kernel_headers_dir="$BUILDTMP/debian/hdrtmp"
+       libc_headers_dir="$BUILDTMP/debian/headertmp"
+else
+       tmpdir="$objtree/debian/tmp"
+       fwdir="$objtree/debian/fwtmp"
+       kernel_headers_dir="$objtree/debian/hdrtmp"
+       libc_headers_dir="$objtree/debian/headertmp"
+fi
+
  packagename=linux-image-$version
  fwpackagename=linux-firmware-image
  kernel_headers_packagename=linux-headers-$version

