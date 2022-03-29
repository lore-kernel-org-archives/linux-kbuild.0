Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E186C433F5
	for <linux-kbuild@archiver.kernel.org>; Tue, 29 Mar 2022 02:15:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbiC2CRR (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 28 Mar 2022 22:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbiC2CRR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Mar 2022 22:17:17 -0400
Received: from conuserg-08.nifty.com (conuserg-08.nifty.com [210.131.2.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7FAA62DE;
        Mon, 28 Mar 2022 19:15:34 -0700 (PDT)
Received: from grover.. (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 22T2EldY011474;
        Tue, 29 Mar 2022 11:14:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 22T2EldY011474
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1648520088;
        bh=a/20eFtvZJF7v9cQZmxJhWBcVrxKCzkvlDx3FnHlTnE=;
        h=From:To:Cc:Subject:Date:From;
        b=vaOkc45/8LY4DlNgN8R0ZTPyjHLmY55N5tlE2brnyNlu6cazSuSsGVxhU3YFjJZHe
         20G2GOEb8iv9dVLrgmVbv4Bduqh7UIrAuWdOo6DqmRfYEQ6qOpXF8d+p9wZ0/Uszgn
         9LYmHsrMcPxGVfadiKL35rjz4fIsbs/L/GQV5ei58l8uQEnl9lb1AejrcwHzDOmVaW
         3BxSwxHL0mKgAPdVjxc9vg0wgW0e0b6aM+NQknqFfuvYgYY29U3QffJfgkInEPiVLn
         2CBCiUrxBnAUdY3gnfik8zEIYZEEg4fainS87EOMtG61MDTDc/zKhzK2gMc04y3GHn
         BctC3EO4o66Sg==
X-Nifty-SrcIP: [133.32.177.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH] kbuild: fix empty ${PYTHON} in scripts/link-vmlinux.sh
Date:   Tue, 29 Mar 2022 11:14:36 +0900
Message-Id: <20220329021437.308790-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The two commits

  d8d2d38275c1 ("kbuild: remove PYTHON variable")
  a8cccdd95473 ("init: lto: ensure initcall ordering")

were applied in the same development cycle, in two different trees.

After they were merged together, this ${PYTHON} expands to an empty
string.

Therefore, ${srctree}/scripts/jobserver-exec is executed directly.
(it has the executable bit set)

This is working but let's fix the code into the intended form.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/link-vmlinux.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index f704034ebbe6..20f44504a644 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -50,7 +50,7 @@ gen_initcalls()
 {
 	info GEN .tmp_initcalls.lds
 
-	${PYTHON} ${srctree}/scripts/jobserver-exec		\
+	${PYTHON3} ${srctree}/scripts/jobserver-exec		\
 	${PERL} ${srctree}/scripts/generate_initcall_order.pl	\
 		${KBUILD_VMLINUX_OBJS} ${KBUILD_VMLINUX_LIBS}	\
 		> .tmp_initcalls.lds
-- 
2.32.0

