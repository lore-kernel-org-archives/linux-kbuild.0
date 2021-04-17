Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC3FC43460
	for <linux-kbuild@archiver.kernel.org>; Sat, 17 Apr 2021 14:51:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0123610CD
	for <linux-kbuild@archiver.kernel.org>; Sat, 17 Apr 2021 14:51:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236537AbhDQOvj (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 17 Apr 2021 10:51:39 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:23576 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236287AbhDQOvi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 10:51:38 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 13HEodoF021728;
        Sat, 17 Apr 2021 23:50:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 13HEodoF021728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618671040;
        bh=wk8ZozLuLgTh8OI9eh8aeLslD6n/gVEC+NMmhcoYbkY=;
        h=From:To:Cc:Subject:Date:From;
        b=i3JjVOzNE4u2snfGxtuYrPx+2s6yiHBSSEcodolDoX5WzCVoX52J9hz7VpeML+TYB
         YFVaT2e1Pz5DvNYBwxzBenYWBDXMnl3jw1//vXH+u7CDpYYLHAh09Va06Wr5zmapHz
         07oW48KLxZ6RO6egM26w+0IptJqt6Y1Z/fj7p/swTU8MeYlogDfq9tAbtWKXA4h6r8
         MsBucJhlML+Iuir77RK/B+o64b07h03pZdApehP/ab+YwjXK7EjgsYnNNdYYSU300p
         aFXpaMwMAcXWwBnOC9ahem5f/BV0FA83MCxUTXQGok6YNAg5aDNolj4EjsfHDYle0H
         Nv3/LxCP8hIZQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kconfig: remove unused PACKAGE definition
Date:   Sat, 17 Apr 2021 23:50:36 +0900
Message-Id: <20210417145037.349822-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 3b9fa0931dd8 ("[PATCH] Kconfig i18n support") added this code,
and then commit ("kconfig: drop localization support") removed the
i18n support entirely.

Remove the left-over.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/lkc.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 45599c52478d..fa8c010aa683 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -20,10 +20,6 @@ extern "C" {
 
 #define SRCTREE "srctree"
 
-#ifndef PACKAGE
-#define PACKAGE "linux"
-#endif
-
 #ifndef CONFIG_
 #define CONFIG_ "CONFIG_"
 #endif
-- 
2.27.0

