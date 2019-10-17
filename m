Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44170 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbfJQKW0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Oct 2019 06:22:26 -0400
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] NM variable missed the value,so fixed
Date: Thu, 17 Oct 2019 15:51:59 +0530
Message-Id: <20191017102159.20387-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, rdunlap@infradead.org, torvalds@linux-foundation.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>

This patch will provide the missing value for NM variable.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/mksysmap | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mksysmap b/scripts/mksysmap
index a35acc0d0b82..4b2f45c45f14 100755
--- a/scripts/mksysmap
+++ b/scripts/mksysmap
@@ -40,5 +40,5 @@
 # 'W' or 'w'. __crc_ are 'A' and placed in the middle
 # so we just ignore them to let readprofile continue to work.
 # (At least sparc64 has __crc_ in the middle).
-
+NM=$(which nm)
 $NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( .L\)' > $2
--
2.21.0
