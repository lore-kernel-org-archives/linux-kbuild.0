Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:33833 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752096Ab1A3LS4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 30 Jan 2011 06:18:56 -0500
Received: by fxm20 with SMTP id 20so4731119fxm.19
        for <linux-kbuild@vger.kernel.org>; Sun, 30 Jan 2011 03:18:55 -0800 (PST)
Message-ID: <4D45491B.80007@gmail.com>
Date: Sun, 30 Jan 2011 12:18:51 +0100
From: Zdenek Kaspar <zkaspar82@gmail.com>
MIME-Version: 1.0
Subject: Re: Add make tarxz-pkg build option
References: <4D43417A.1020603@gmail.com>
In-Reply-To: <4D43417A.1020603@gmail.com>
Content-Type: multipart/mixed;
 boundary="------------000904090109020806080307"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format.
--------------000904090109020806080307
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit

oops.. now with proper perf-tarxz-src-pkg.

Z.

--------------000904090109020806080307
Content-Type: text/plain;
 name="add-tarxz-target-v2.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="add-tarxz-target-v2.diff"

Signed-off-by: Zdenek Kaspar <zkaspar82@gmail.com>

--- linux-2.6-HEAD-1f0324c.orig/scripts/package/Makefile	2011-01-28 03:24:34.000000000 +0100
+++ linux-2.6-HEAD-1f0324c/scripts/package/Makefile	2011-01-30 11:58:38.875576503 +0100
@@ -127,7 +127,8 @@
 $(if $(findstring tar-src,$@),,                                     \
 $(if $(findstring bz2,$@),bzip2,                                    \
 $(if $(findstring gz,$@),gzip,                                      \
-$(error unknown target $@)))                                       \
+$(if $(findstring xz,$@),xz,                                        \
+$(error unknown target $@))))                                       \
 	-f -9 $(perf-tar).tar)
 
 perf-%pkg: FORCE
@@ -142,7 +143,9 @@
 	@echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
 	@echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
 	@echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
+	@echo '  tarxz-pkg           - Build the kernel as a xz compressed tarball'
 	@echo '  perf-tar-src-pkg    - Build $(perf-tar).tar source tarball'
 	@echo '  perf-targz-src-pkg  - Build $(perf-tar).tar.gz source tarball'
 	@echo '  perf-tarbz2-src-pkg - Build $(perf-tar).tar.bz2 source tarball'
+	@echo '  perf-tarxz-src-pkg  - Build $(perf-tar).tar.xz source tarball'
 
--- linux-2.6-HEAD-1f0324c.orig/scripts/package/buildtar	2011-01-28 03:24:34.000000000 +0100
+++ linux-2.6-HEAD-1f0324c/scripts/package/buildtar	2011-01-30 11:43:57.728196352 +0100
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

--------------000904090109020806080307--
