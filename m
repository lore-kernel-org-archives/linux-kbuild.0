Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 2481.rev.megiteam.pl ([91.227.36.129]:51225 "EHLO
	vk1001.megiteam.com.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758442Ab2CWO7j (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 23 Mar 2012 10:59:39 -0400
Message-ID: <4F6C8FD7.70901@localdomain.pl>
Date: Fri, 23 Mar 2012 15:59:35 +0100
From: Grzegorz Nosek <root@localdomain.pl>
MIME-Version: 1.0
Subject: [PATCH v2] Don't force deb architecture on universal packages
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Asbjoern Sloth Toennesen <asbjorn@asbjorn.biz>, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>, root@localdomain.pl

$debarch is basically always set so the Architecture field from
debian/control is ignored. While we don't really care for most packages
(they have Architecture: any or some specific $arch), this breaks the
firmware package as it becomes an arch-dependent .deb, ignoring its
Architecture: all entry.

It's apparently broken by 10f26fa64200095af0e5d80a980e47877865e4b7.

Signed-off-by: Grzegorz Nosek <root@localdomain.pl>
---
Note: this is based on 3.2 as that's what I'm currently using. I'll
rebase onto whatever is required when the general idea is accepted.

(earlier version was completely bogus, sorry for that)

Best regards,
 Grzegorz Nosek

 scripts/package/builddeb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 3c6c0b1..43476c5 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -57,8 +57,11 @@ create_package() {
 	if [ -n "$KBUILD_DEBARCH" ] ; then
 		debarch="$KBUILD_DEBARCH"
 	fi
-	if [ -n "$debarch" ] ; then
-		forcearch="-DArchitecture=$debarch"
+	if [ -n "$debarch" ]; then
+		pkgarch=`sed -n "/^Package: $pname\$/,/^\$/s/^Architecture: //p" debian/control`
+		if [ "$pkgarch" != "all" ]; then
+			forcearch="-DArchitecture=$debarch"
+		fi
 	fi

 	# Create the package
-- 
1.7.2.3
