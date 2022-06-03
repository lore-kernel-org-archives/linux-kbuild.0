Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55701C43334
	for <linux-kbuild@archiver.kernel.org>; Fri,  3 Jun 2022 13:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbiFCNVE (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 3 Jun 2022 09:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244577AbiFCNVD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jun 2022 09:21:03 -0400
Received: from conuserg-08.nifty.com (conuserg-08.nifty.com [210.131.2.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B02245A7;
        Fri,  3 Jun 2022 06:20:59 -0700 (PDT)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 253DK9iZ017775;
        Fri, 3 Jun 2022 22:20:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 253DK9iZ017775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1654262410;
        bh=spC6MajrG7NwKyGAmtsaMom7omn96bhzYQ3DbtXXdUQ=;
        h=From:To:Cc:Subject:Date:From;
        b=lxJ8Xf9aqNk0ACrYsK55j3NPxVmCltv1xvvgs77EktylSY8v+BOjmQ+cHuNJLU4xY
         f/ox0PHL3BTsRKAR0qgTd1jxziMP0L5QetYEvSFokM4ZBj/Yq+O3+KQhHdZSzAMsc8
         cfIw0umlUiDOQCgG6arQhr0SZdk1y9zj6zJYRrB47STU6Uu/ZVsXepoPU8i8ZOH3vA
         DVJlVKn5ki5b85Bk90ESJLyO+DdgjPEbQ8Wb9wM5AD04IlWMVJSKB7k67CMy4KyFTa
         iX1Y/KuHXalaEU7Fp9TqcLC0H/mBCwcSVGusk4qw1K7d0BW1l1Mz379HS90oF9ldRi
         vk0visl+cnfIA==
X-Nifty-SrcIP: [133.32.177.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicolas Schier <n.schier@avm.de>
Subject: [PATCH] scripts/objdiff: fix stale comments about .tmp_objdiff
Date:   Fri,  3 Jun 2022 22:20:07 +0900
Message-Id: <20220603132008.3935851-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Fix the two occurrences of .tmp_objdiff in the comment block.

Fixes: 0ef3bf716886 ("kbuild: clean .tmp_* pattern by make clean")
Reported-by: Nicolas Schier <n.schier@avm.de>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/objdiff | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/objdiff b/scripts/objdiff
index 68b8d74e5c6f..0685bc3ce3df 100755
--- a/scripts/objdiff
+++ b/scripts/objdiff
@@ -20,10 +20,10 @@
 # $ ./scripts/objdiff diff COMMIT_A COMMIT_B
 # $
 
-# And to clean up (everything is in .tmp_objdiff/*)
+# And to clean up (everything is in .objdiff/*)
 # $ ./scripts/objdiff clean all
 #
-# Note: 'make mrproper' will also remove .tmp_objdiff
+# Note: 'make mrproper' will also remove .objdiff
 
 SRCTREE=$(cd $(git rev-parse --show-toplevel 2>/dev/null); pwd)
 
-- 
2.32.0

