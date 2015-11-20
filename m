Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:34852 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761238AbbKTXvH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 20 Nov 2015 18:51:07 -0500
From: Jim Davis <jim.epost@gmail.com>
Subject: [PATCH] scripts/package/buildtar: don't complain if lib/ is missing
Date: Fri, 20 Nov 2015 16:50:36 -0700
Message-Id: <1448063436-32486-1-git-send-email-jim.epost@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Building a tinyconfig kernel or similar stripped-down configurations
may not have a lib directory to tar up.  Test for a lib directory to
avoid an unnecessary error message.

Signed-off-by: Jim Davis <jim.epost@gmail.com>
---
 scripts/package/buildtar | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index e046bff33589..b52475d2be3b 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -129,7 +129,11 @@ esac
 	if tar --owner=root --group=root --help >/dev/null 2>&1; then
 		opts="--owner=root --group=root"
 	fi
-	tar cf - -C "$tmpdir" boot/ lib/ $opts | ${compress} > "${tarball}${file_ext}"
+	lib=
+	if test -d "$tmpdir/lib"; then
+		lib="lib/"
+	fi
+	tar cf - -C "$tmpdir" boot/ $lib $opts | ${compress} > "${tarball}${file_ext}"
 )
 
 echo "Tarball successfully created in ${tarball}${file_ext}"
-- 
2.6.2.195.g0c4dd78

