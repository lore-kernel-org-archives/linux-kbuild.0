Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:13209 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751687AbdCMWVI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Mar 2017 18:21:08 -0400
From: Joe Konno <joe.konno@linux.intel.com>
Subject: [PATCH] scripts: package: KDEB_SOURCENAME in .deb names
Date: Mon, 13 Mar 2017 15:21:06 -0700
Message-Id: <1489443666-29808-1-git-send-email-joe.konno@linux.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

From: Joe Konno <joe.konno@intel.com>

Currently, the KDEB_SOURCENAME make variable only controls the name of the
packaged source tarball, and does not impact the .deb package names output
by bindeb-pkg and deb-pkg. Presently, these files are more rigidly named,
as the user may only control the names of .deb outputs by setting
KDEB_PKGVERSION in their environment.

This patch modifies the builddeb script to use KDEB_SOURCENAME when naming
the image, firmware-image, headers, and libc-dev .deb output files. This
would allow folks who build-- for instance-- mainline, stable, and next
kernel packages more control over how their .deb outputs are named.

This patch also changes the default value of KDEB_SOURCENAME so as not to
change default .deb output file names. However, this does have the side
effect of renaming the source tarball generated for .deb source packages.

For example:
  $ KDEB_SOURCENAME="linux-mainline" make bindeb-pkg

Would output .deb files that begin with
  ../linux-mainline-{image,firmware-image,headers,libc-dev}

Signed-off-by: Joe Konno <joe.konno@intel.com>
---
 scripts/package/Makefile | 2 +-
 scripts/package/builddeb | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 71b4a8af9d4d..e4280da03991 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -23,7 +23,7 @@
 
 # Remove hyphens since they have special meaning in RPM filenames
 KERNELPATH := kernel-$(subst -,_,$(KERNELRELEASE))
-KDEB_SOURCENAME ?= linux-$(KERNELRELEASE)
+KDEB_SOURCENAME ?= linux
 export KDEB_SOURCENAME
 # Include only those top-level files that are needed by make, plus the GPL copy
 TAR_CONTENT := $(KBUILD_ALLDIRS) .config .scmversion Makefile \
diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 3c575cd07888..50caa143fb13 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -96,10 +96,10 @@ fwdir="$objtree/debian/fwtmp"
 kernel_headers_dir="$objtree/debian/hdrtmp"
 libc_headers_dir="$objtree/debian/headertmp"
 dbg_dir="$objtree/debian/dbgtmp"
-packagename=linux-image-$version
-fwpackagename=linux-firmware-image-$version
-kernel_headers_packagename=linux-headers-$version
-libc_headers_packagename=linux-libc-dev
+packagename=${sourcename}-image-$version
+fwpackagename=${sourcename}-firmware-image-$version
+kernel_headers_packagename=${sourcename}-headers-$version
+libc_headers_packagename=${sourcename}-libc-dev
 dbg_packagename=$packagename-dbg
 debarch=
 forcearch=
-- 
2.7.4

