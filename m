Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:39917 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752671AbdIBIGE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Sep 2017 04:06:04 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] kbuild: buildtar: fix tar error when CONFIG_MODULES is disabled
Date: Sat,  2 Sep 2017 17:05:34 +0900
Message-Id: <1504339535-31825-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

$tmpdir/lib is created by "make modules_install".  It does not exist
if CONFIG_MODULES is disabled, then tar reports the following messages:

tar: lib: Cannot stat: No such file or directory
tar: Exiting with failure status due to previous errors

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/buildtar | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 483ba00524d5..60dd836a0214 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -51,13 +51,14 @@ esac
 #
 rm -rf -- "${tmpdir}"
 mkdir -p -- "${tmpdir}/boot"
-
+dirs=boot
 
 #
 # Try to install modules
 #
 if grep -q '^CONFIG_MODULES=y' "${KCONFIG_CONFIG}"; then
 	make ARCH="${ARCH}" O="${objtree}" KBUILD_SRC= INSTALL_MOD_PATH="${tmpdir}" modules_install
+	dirs="$dirs lib"
 fi
 
 
@@ -129,7 +130,7 @@ esac
 	if tar --owner=root --group=root --help >/dev/null 2>&1; then
 		opts="--owner=root --group=root"
 	fi
-	tar cf - -C "$tmpdir" boot/ lib/ $opts | ${compress} > "${tarball}${file_ext}"
+	tar cf - -C "$tmpdir" $dirs $opts | ${compress} > "${tarball}${file_ext}"
 )
 
 echo "Tarball successfully created in ${tarball}${file_ext}"
-- 
2.7.4

