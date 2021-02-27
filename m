Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677F1C433E0
	for <linux-kbuild@archiver.kernel.org>; Sat, 27 Feb 2021 05:56:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AD4564EB3
	for <linux-kbuild@archiver.kernel.org>; Sat, 27 Feb 2021 05:56:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhB0F4g (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 27 Feb 2021 00:56:36 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:30569 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhB0F4g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Feb 2021 00:56:36 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 11R5tbT9012049;
        Sat, 27 Feb 2021 14:55:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 11R5tbT9012049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614405337;
        bh=Hh46TLDMGRj9Od269X4TVtHg2fLoWjuatPR/1X4lShc=;
        h=From:To:Cc:Subject:Date:From;
        b=OIdXG+VDsWEkB6mZKMPYrqUW3tzApbSF2zYRUkMxHC/mvYsPfFdEu+Q5kHLwFOrHJ
         QtgF248YEzhfsvtkdsQ2hz+KkGCybjSMQmQwKdyBVUNR3XhyPsMjgrjt0WhLC9IVns
         +YYieSSmPsUoaOQWmoPUct1nfBEA9PC+peIpzI3dm8hXhCvjMYAETiYWXatJmseSqj
         kgl6XDTOU7Iu4yRSsG2TahQOsFpCv17qTIM09XDlNQxk+Kpw5bG9yvS+p1VZfGph74
         y6DX54mkN+Fyuh9dofMFivqPTCBkdeuZ/spDb3oc2lTfPcRSlXkKaUGNLZTltXI2sP
         NiGGnwUZ+LHyw==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Brian Cain <bcain@codeaurora.org>,
        linux-hexagon@vger.kernel.org
Subject: [PATCH] hexagon: add arch/hexagon/Kbuild
Date:   Sat, 27 Feb 2021 14:55:34 +0900
Message-Id: <20210227055534.4075178-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use the standard obj-y form to specify the sub-directories under
arch/hexagon/. No functional change intended.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/hexagon/Kbuild   | 2 ++
 arch/hexagon/Makefile | 5 +----
 2 files changed, 3 insertions(+), 4 deletions(-)
 create mode 100644 arch/hexagon/Kbuild

diff --git a/arch/hexagon/Kbuild b/arch/hexagon/Kbuild
new file mode 100644
index 000000000000..8421baba1351
--- /dev/null
+++ b/arch/hexagon/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y += kernel/ mm/ lib/
diff --git a/arch/hexagon/Makefile b/arch/hexagon/Makefile
index c168c6980d05..80583548b81e 100644
--- a/arch/hexagon/Makefile
+++ b/arch/hexagon/Makefile
@@ -34,7 +34,4 @@ LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name 2>/dev/null)
 libs-y += $(LIBGCC)
 
 head-y := arch/hexagon/kernel/head.o
-
-core-y += arch/hexagon/kernel/ \
-	arch/hexagon/mm/ \
-	arch/hexagon/lib/
+core-y += arch/hexagon/
-- 
2.27.0

