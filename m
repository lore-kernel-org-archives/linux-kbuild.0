Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:39901 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752669AbdIBIGE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Sep 2017 04:06:04 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kbuild: buildtar: do not print successful message if tar returns error
Date: Sat,  2 Sep 2017 17:05:35 +0900
Message-Id: <1504339535-31825-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1504339535-31825-1-git-send-email-yamada.masahiro@socionext.com>
References: <1504339535-31825-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

The previous commit spotted that "Tarball successfully created ..."
is displayed even if the "tar" command returns error code because
it is followed by "| ${compress}".

Let the build fail instead of printing the successful message since
if the "tar" command fails, the output may not be what users expect.

Avoid the use of the pipe.  While we are here, refactor the script
removing the use of sub-shell, ${compress}, ${file_ext}.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/buildtar | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 60dd836a0214..51f947118256 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -24,20 +24,19 @@ tarball="${objtree}/linux-${KERNELRELEASE}-${ARCH}.tar"
 #
 case "${1}" in
 	tar-pkg)
-		compress="cat"
-		file_ext=""
+		opts=
 		;;
 	targz-pkg)
-		compress="gzip"
-		file_ext=".gz"
+		opts=--gzip
+		tarball=${tarball}.gz
 		;;
 	tarbz2-pkg)
-		compress="bzip2"
-		file_ext=".bz2"
+		opts=--bzip2
+		tarball=${tarball}.bz2
 		;;
 	tarxz-pkg)
-		compress="xz"
-		file_ext=".xz"
+		opts=--xz
+		tarball=${tarball}.xz
 		;;
 	*)
 		echo "Unknown tarball target \"${1}\" requested, please add it to ${0}." >&2
@@ -125,14 +124,12 @@ esac
 #
 # Create the tarball
 #
-(
-	opts=
-	if tar --owner=root --group=root --help >/dev/null 2>&1; then
-		opts="--owner=root --group=root"
-	fi
-	tar cf - -C "$tmpdir" $dirs $opts | ${compress} > "${tarball}${file_ext}"
-)
+if tar --owner=root --group=root --help >/dev/null 2>&1; then
+	opts="$opts --owner=root --group=root"
+fi
+
+tar cf $tarball -C $tmpdir $opts $dirs
 
-echo "Tarball successfully created in ${tarball}${file_ext}"
+echo "Tarball successfully created in $tarball"
 
 exit 0
-- 
2.7.4

