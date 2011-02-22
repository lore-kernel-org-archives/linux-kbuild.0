Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eazy.amigager.de ([213.239.192.238]:49866 "EHLO
	eazy.amigager.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754863Ab1BVTcy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Feb 2011 14:32:54 -0500
Received: from mac.home (port-92-206-0-194.dynamic.qsc.de [92.206.0.194])
	by eazy.amigager.de (Postfix) with ESMTPA id 23FACF4805D
	for <linux-kbuild@vger.kernel.org>; Tue, 22 Feb 2011 20:26:11 +0100 (CET)
Date: Tue, 22 Feb 2011 20:26:08 +0100
From: Tino Keitel <tino@tikei.de>
Subject: [PATCH] .gitignore: ignore *.xz files
Message-ID: <20110222192608.GA7125@mac.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

The kernel image can now be xz compressed. Ignore such files.

Acked-by: Jesper Juhl <jj@chaosbits.net>
Signed-off-by: Tino Keitel <tino@tikei.de>
---
 .gitignore |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/.gitignore b/.gitignore
index 8faa6c0..c0128d3 100644
--- a/.gitignore
+++ b/.gitignore
@@ -29,6 +29,7 @@ modules.builtin
 *.bz2
 *.lzma
 *.lzo
+*.xz
 *.patch
 *.gcno
 
-- 
1.7.2.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/

