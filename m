Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailhub.sw.ru ([195.214.232.25]:24361 "EHLO relay.sw.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752041AbcHPVjo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Aug 2016 17:39:44 -0400
From: Dmitry Monakhov <dmonakhov@openvz.org>
Subject: [PATCH 1/2] scripts: buildtar fix build w/o modules v2
Date: Wed, 17 Aug 2016 01:39:36 +0400
Message-Id: <1471383577-18173-1-git-send-email-dmonakhov@openvz.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Dmitry Monakhov <dmonakhov@openvz.org>

If build configured w/o modules script fails because lib/ is not exit.

Signed-off-by: Dmitry Monakhov <dmonakhov@openvz.org>
---
 scripts/package/buildtar | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index e046bff..27a2ed3 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -17,7 +17,7 @@ set -e
 #
 tmpdir="${objtree}/tar-install"
 tarball="${objtree}/linux-${KERNELRELEASE}-${ARCH}.tar"
-
+tarball_dirs="boot"
 
 #
 # Figure out how to compress, if requested at all
@@ -58,6 +58,7 @@ mkdir -p -- "${tmpdir}/boot"
 #
 if grep -q '^CONFIG_MODULES=y' "${objtree}/.config"; then
 	make ARCH="${ARCH}" O="${objtree}" KBUILD_SRC= INSTALL_MOD_PATH="${tmpdir}" modules_install
+	tarball_dirs="${tarball_dirs} lib"
 fi
 
 
@@ -129,7 +130,7 @@ esac
 	if tar --owner=root --group=root --help >/dev/null 2>&1; then
 		opts="--owner=root --group=root"
 	fi
-	tar cf - -C "$tmpdir" boot/ lib/ $opts | ${compress} > "${tarball}${file_ext}"
+	tar cf - -C "$tmpdir" "$tarball_dirs" $opts | ${compress} > "${tarball}${file_ext}"
 )
 
 echo "Tarball successfully created in ${tarball}${file_ext}"
-- 
2.7.4

