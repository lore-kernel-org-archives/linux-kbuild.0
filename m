Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.asbjorn.biz ([217.195.185.3]:57933 "EHLO mail.asbjorn.biz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751069Ab0KAXpV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Nov 2010 19:45:21 -0400
From: Asbjoern Sloth Toennesen <asbjorn@asbjorn.biz>
Subject: [PATCH] kbuild, deb-pkg: fix Architecture field when cross compiling
Date: Mon,  1 Nov 2010 23:31:01 +0000
Message-Id: <1288654261-8269-1-git-send-email-asbjorn@asbjorn.biz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

If the environment variable CROSS_COMPILE is set, override
the Architecture control field, based on the value of the
ARCH environment variable.

With this patch the following make command:

	make CROSS_COMPILE='' ARCH=i386 deb-pkg

will output an i386 Debian package instead of an amd64 one,
when run on amd64 machine.

Signed-off-by: Asbjoern Sloth Toennesen <asbjorn@asbjorn.biz>
---
 scripts/package/builddeb |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 49b74e1..e5b7b9b 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -25,8 +25,20 @@ create_package() {
 	chown -R root:root "$pdir"
 	chmod -R go-w "$pdir"
 
+	# Check for cross compilation
+	local forcearch=""
+	env | grep -q CROSS_COMPILE
+	if [ $? -eq 0 ] ; then
+		local debarch=""
+		case "$ARCH" in
+			x86_64) debarch="amd64" ;;
+			*) debarch="$ARCH" ;;
+		esac
+		forcearch="-DArchitecture=$debarch"
+	fi
+
 	# Create the package
-	dpkg-gencontrol -isp -p$pname -P"$pdir"
+	dpkg-gencontrol -isp $forcearch -p$pname -P"$pdir"
 	dpkg --build "$pdir" ..
 }
 
-- 
1.7.2.3

