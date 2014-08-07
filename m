Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e24smtp05.br.ibm.com ([32.104.18.26]:49215 "EHLO
	e24smtp05.br.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750874AbaHGUdM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Aug 2014 16:33:12 -0400
Received: from /spool/local
	by e24smtp05.br.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <cascardo@linux.vnet.ibm.com>;
	Thu, 7 Aug 2014 17:33:10 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@linux.vnet.ibm.com>
Subject: [PATCH] deb-pkg: support ppc64 and ppc64el Debian archs
Date: Thu,  7 Aug 2014 17:32:53 -0300
Message-Id: <1407443573-21522-1-git-send-email-cascardo@linux.vnet.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, brenohl@br.ibm.com, Thadeu Lima de Souza Cascardo <cascardo@linux.vnet.ibm.com>

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@linux.vnet.ibm.com>
---
 scripts/package/builddeb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 35d5a58..c26c28b 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -36,6 +36,8 @@ create_package() {
 		debarch=sparc ;;
 	s390*)
 		debarch=s390$(grep -q CONFIG_64BIT=y $KCONFIG_CONFIG && echo x || true) ;;
+	ppc64*)
+		debarch=ppc64$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo el || true) ;;
 	ppc*)
 		debarch=powerpc ;;
 	parisc*)
-- 
1.7.1

