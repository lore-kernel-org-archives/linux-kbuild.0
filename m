Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:46944 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751220Ab1A1WWX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 28 Jan 2011 17:22:23 -0500
Received: by fxm20 with SMTP id 20so3858690fxm.19
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Jan 2011 14:22:21 -0800 (PST)
Message-ID: <4D43417A.1020603@gmail.com>
Date: Fri, 28 Jan 2011 23:21:46 +0100
From: Zdenek Kaspar <zkaspar82@gmail.com>
MIME-Version: 1.0
Subject: Add make tarxz-pkg build option
Content-Type: multipart/mixed;
 boundary="------------070600010209070205040006"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format.
--------------070600010209070205040006
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit

Hi! Most distributions use xz-utils already, is it possible to add
tarxz-pkg option ?

NB: If someone thinks xz -9 is a bit hardcore, it's not much different
like when bzip2 -9 was introduced into buildtar as an option imo..

TIA, Z.

--------------070600010209070205040006
Content-Type: text/plain;
 name="add-tarxz-target.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="add-tarxz-target.diff"

Signed-off-by: Zdenek Kaspar <zkaspar82@gmail.com>

--- a/scripts/package/Makefile	2011-01-28 23:05:03.000000000 +0100
+++ b/scripts/package/Makefile	2011-01-28 23:07:10.000000000 +0100
@@ -142,7 +142,9 @@
 	@echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
 	@echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
 	@echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
+	@echo '  tarxz-pkg           - Build the kernel as a xz compressed tarball'
 	@echo '  perf-tar-src-pkg    - Build $(perf-tar).tar source tarball'
 	@echo '  perf-targz-src-pkg  - Build $(perf-tar).tar.gz source tarball'
 	@echo '  perf-tarbz2-src-pkg - Build $(perf-tar).tar.bz2 source tarball'
+	@echo '  perf-tarxz-src-pkg  - Build $(perf-tar).tar.xz source tarball'
 
--- a/scripts/package/buildtar	2011-01-28 23:05:03.000000000 +0100
+++ b/scripts/package/buildtar	2011-01-28 23:08:20.000000000 +0100
@@ -35,6 +35,10 @@
 		compress="bzip2 -c9"
 		file_ext=".bz2"
 		;;
+	tarxz-pkg)
+		compress="xz -c9"
+		file_ext=".xz"
+		;;
 	*)
 		echo "Unknown tarball target \"${1}\" requested, please add it to ${0}." >&2
 		exit 1

--------------070600010209070205040006--
