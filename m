Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay2.synopsys.com ([198.182.60.111]:59121 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752394AbdFNMlH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jun 2017 08:41:07 -0400
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH] Unexport LANG env variable
Date: Wed, 14 Jun 2017 15:40:56 +0300
Message-Id: <1497444056-24962-1-git-send-email-abrodkin@synopsys.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-snps-arc@lists.infradead.org, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>

In those cases when we parse output of standard utilities like readelf
etc we rely on a particular sentences. For example for ARC we extract
an entry-point from vmlinux like that:
---------------------->8--------------------
readelf -h vmlinux | grep "Entry point address" | grep -o 0x.*
---------------------->8--------------------

And in case LANG is set to anything other than en_XX we're getting
nothing and subsequent execution of mkimage utility fails.

Probably there're more cases like that but given people rarely
use non-English locales on their dev machines problems like the one
above are not very visible.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index cdaa747f2a6a..581e684783ef 100644
--- a/Makefile
+++ b/Makefile
@@ -17,6 +17,7 @@ MAKEFLAGS += -rR --include-dir=$(CURDIR)
 
 # Avoid funny character set dependencies
 unexport LC_ALL
+unexport LANG
 LC_COLLATE=C
 LC_NUMERIC=C
 export LC_COLLATE LC_NUMERIC
-- 
2.7.5

