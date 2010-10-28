Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:38089 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932685Ab0J1C2f (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 27 Oct 2010 22:28:35 -0400
Received: by qyk10 with SMTP id 10so1560298qyk.19
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Oct 2010 19:28:35 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH] kbuild: convert `arch/tile' to the kconfig mainmenu upgrade
Date: Wed, 27 Oct 2010 22:24:49 -0400
Message-Id: <1288232689-11676-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Hi Michal,

As 2.6.36 is out, the kconfig change will require this patch. I had it for a
while in my tree, but the kconfig branch lacked the code :)

 - Arnaud

From: Arnaud Lacombe <lacombar@gmail.com>
Date: Mon, 20 Sep 2010 00:47:11 -0400
Subject: [PATCH] kbuild: convert `arch/tile' to the kconfig mainmenu upgrade

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 arch/tile/Kconfig |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/tile/Kconfig b/arch/tile/Kconfig
index 1eb308c..d0cc5b4 100644
--- a/arch/tile/Kconfig
+++ b/arch/tile/Kconfig
@@ -113,8 +113,6 @@ config TILE
 #       config HUGETLB_PAGE_SIZE_VARIABLE
 
 
-mainmenu "Linux/TILE Kernel Configuration"
-
 # Please note: TILE-Gx support is not yet finalized; this is
 # the preliminary support.  TILE-Gx drivers are only provided
 # with the alpha or beta test versions for Tilera customers.
-- 
1.7.2.30.gc37d7.dirty

