Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:36550 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752023AbbIOSL4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Sep 2015 14:11:56 -0400
Received: by lbcao8 with SMTP id ao8so90006353lbc.3
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2015 11:11:55 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH v2] builddeb: remove debian/files before build
Date: Tue, 15 Sep 2015 21:11:52 +0300
Message-Id: <1442340712-8991-1-git-send-email-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz
Cc: ben@decadent.org.uk, dsmythies@telus.net, kvalo@qca.qualcomm.com, Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

As debian/files keeps accumulating entries, the changes file
will end up growing indefinelty. Remove the file in clean
rule and before build starts.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
Reported-by: Doug Smythies <dsmythies@telus.net>
---
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

