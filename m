Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211E6C433ED
	for <linux-kbuild@archiver.kernel.org>; Wed, 12 May 2021 07:58:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E29EC613BF
	for <linux-kbuild@archiver.kernel.org>; Wed, 12 May 2021 07:58:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbhELH7v (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 12 May 2021 03:59:51 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:43247 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhELH7v (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 May 2021 03:59:51 -0400
Received: from grover.RMN.KIBA.LAB.jp (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 14C7vbPt028192;
        Wed, 12 May 2021 16:57:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 14C7vbPt028192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620806262;
        bh=GedbzCCJCAPRNECZua9lPIWPhczb61cxZ1yg+Fbq1rw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dvgkQ7C0TnzwLz+GPWXRNHRF07mQ+u+qTT8XF9o1d337I70WCRVp2VXrYwYsZwC0w
         oRl5Beof2gk4zbRmE8mHo8i7gqmkrUJv2rI9ki2fpQ8wfiPxab4wNGt2wrjyqq0pC2
         rQhbZsoacpuXJFbEQL+PVUnQHWsZha0O0r2egLWPRoYGi0yJa/8fAyg16xRPM+wtG0
         FsvB3QOyZLiVC28vOzhYeY0aJMr+mHCunjayVh4lza0I88pajLXAhTuL6U0gUi4EB0
         WBLUpEhaoLB6nSfkhJ2lnG2Hj9z1SLrU+m4ZN5LdQtgaRM8v2euP9dC6wdGx3EvlsI
         uBNihKuRiXNUw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Richard Henderson <rth@twiddle.net>,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] alpha: move core-y in arch/alpha/Makefile to arch/alpha/Kbuild
Date:   Wed, 12 May 2021 16:57:26 +0900
Message-Id: <20210512075729.60291-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210512075729.60291-1-masahiroy@kernel.org>
References: <20210512075729.60291-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use obj-y to clean up Makefile.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/alpha/Kbuild   | 2 ++
 arch/alpha/Makefile | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/Kbuild b/arch/alpha/Kbuild
index a4e40e534e6a..c2302017403a 100644
--- a/arch/alpha/Kbuild
+++ b/arch/alpha/Kbuild
@@ -1 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-y			+= kernel/ mm/
+obj-$(CONFIG_MATHEMU)	+= math-emu/
diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
index c2946431d88d..52529ee42dac 100644
--- a/arch/alpha/Makefile
+++ b/arch/alpha/Makefile
@@ -38,8 +38,6 @@ KBUILD_CFLAGS += $(cflags-y) -Wa,-mev6
 
 head-y := arch/alpha/kernel/head.o
 
-core-y				+= arch/alpha/kernel/ arch/alpha/mm/
-core-$(CONFIG_MATHEMU)		+= arch/alpha/math-emu/
 libs-y				+= arch/alpha/lib/
 
 # export what is needed by arch/alpha/boot/Makefile
-- 
2.27.0

