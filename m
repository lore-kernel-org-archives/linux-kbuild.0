Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:49849 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725616AbgFBHpb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Jun 2020 03:45:31 -0400
From: ashimida <ashimida@linux.alibaba.com>
Subject: [PATCH v2] mksysmap: Fix the mismatch of '.L' symbols in System.map
Date: Tue,  2 Jun 2020 15:45:17 +0800
Message-Id: <1591083917-63371-1-git-send-email-ashimida@linux.alibaba.com>
In-Reply-To: <1590920904-60002-1-git-send-email-alios_sys_security@linux.alibaba.com>
References: <1590920904-60002-1-git-send-email-alios_sys_security@linux.alibaba.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: masahiroy@kernel.org, michal.lkml@markovi.net
Cc: linux-kbuild@vger.kernel.org, ashimida <ashimida@linux.alibaba.com>

When System.map was generated, the kernel used mksysmap to
filter the kernel symbols, but all the symbols with the
second letter 'L' in the kernel were filtered out, not just
the symbols starting with 'dot + L'.

For example:
ashimida@ubuntu:~/linux$ cat System.map |grep ' .L'
ashimida@ubuntu:~/linux$ nm -n vmlinux |grep ' .L'
ffff0000088028e0 t bLength_show
......
ffff0000092e0408 b PLLP_OUTC_lock
ffff0000092e0410 b PLLP_OUTA_lock

In the original patch[1], the original intent should
be to filter out all local symbols starting with '.L',
so the dot should be escaped.

[1]. mksysmap: Add h8300 local symbol pattern

Signed-off-by: ashimida <ashimida@linux.alibaba.com>
---
 scripts/mksysmap | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mksysmap b/scripts/mksysmap
index a35acc0..9aa23d1 100755
--- a/scripts/mksysmap
+++ b/scripts/mksysmap
@@ -41,4 +41,4 @@
 # so we just ignore them to let readprofile continue to work.
 # (At least sparc64 has __crc_ in the middle).
 
-$NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( .L\)' > $2
+$NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( \.L\)' > $2
-- 
2.7.4
