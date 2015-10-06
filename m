Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:35420 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751821AbbJFHFi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 6 Oct 2015 03:05:38 -0400
Received: by lbwr8 with SMTP id r8so70527044lbw.2
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Oct 2015 00:05:36 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH v3] builddeb: remove debian/files before build
Date: Tue,  6 Oct 2015 10:05:32 +0300
Message-Id: <1444115132-12863-1-git-send-email-riku.voipio@linaro.org>
In-Reply-To: <20151005134942.2f648b39dd039e24fb613777@linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz, akpm@linux-foundation.org
Cc: Riku Voipio <riku.voipio@linaro.org>, maximilian attems <maks@stro.at>, Chris J Arges <chris.j.arges@canonical.com>

From: Riku Voipio <riku.voipio@linaro.org>

Commit 3716001bcb7f added the ability to create a debian
changelog file. This exposed that previously the builddeb
script hasn't cleared debian/files between builds.

As debian/files keeps accumulating entries, the changes file
will end up growing indefinelty. With outdated entries in
debian/files, builddeb script will exit with failure. This
regression impacts those who use "make deb-pkg" target to
build kernel into a .deb package and never use "make mrproper"
or other means to clean kernel tree from generated directories.

To fix the regression, remove debian/files before starting
build and in the generated clean rule.

Fixes: 3716001bcb7f ("deb-pkg: add source package")
Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
Reported-by: Doug Smythies <dsmythies@telus.net>
Tested-by: Doug Smythies <dsmythies@telus.net>
Tested-by: Kalle Valo <kvalo@codeaurora.org>
Acked-by: Ben Hutchings <ben@decadent.org.uk>
Cc: Michal Marek <mmarek@suse.cz>
Cc: maximilian attems <maks@stro.at>
Cc: Chris J Arges <chris.j.arges@canonical.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---
v3: improved commit message
 scripts/package/builddeb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 0cd46e1..b967e4f 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -115,7 +115,7 @@ esac
 BUILD_DEBUG="$(grep -s '^CONFIG_DEBUG_INFO=y' $KCONFIG_CONFIG || true)"
 
 # Setup the directory structure
-rm -rf "$tmpdir" "$fwdir" "$kernel_headers_dir" "$libc_headers_dir" "$dbg_dir"
+rm -rf "$tmpdir" "$fwdir" "$kernel_headers_dir" "$libc_headers_dir" "$dbg_dir" $objtree/debian/files
 mkdir -m 755 -p "$tmpdir/DEBIAN"
 mkdir -p "$tmpdir/lib" "$tmpdir/boot"
 mkdir -p "$fwdir/lib/firmware/$version/"
@@ -408,7 +408,7 @@ binary-arch:
 	\$(MAKE) KDEB_SOURCENAME=${sourcename} KDEB_PKGVERSION=${packageversion} bindeb-pkg
 
 clean:
-	rm -rf debian/*tmp
+	rm -rf debian/*tmp debian/files
 	mv debian/ debian.backup # debian/ might be cleaned away
 	\$(MAKE) clean
 	mv debian.backup debian
-- 
2.1.4

