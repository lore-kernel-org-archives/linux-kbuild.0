Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D10C433DB
	for <linux-kbuild@archiver.kernel.org>; Sat, 13 Mar 2021 19:50:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA7AF64EBD
	for <linux-kbuild@archiver.kernel.org>; Sat, 13 Mar 2021 19:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234598AbhCMTto (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 13 Mar 2021 14:49:44 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:39825 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234391AbhCMTtH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Mar 2021 14:49:07 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 12DJmef2018162;
        Sun, 14 Mar 2021 04:48:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 12DJmef2018162
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615664922;
        bh=KZJp3Hia5JVlwU61G5LKo7adylHc58fSnTOISpaPHoA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JA0QYcV00T7K1khGfHJqsvH+kPvX5yl0Gk81pg7eABbuid8f1Sy4uKpwbtsVgWsMC
         uEEgB+icBbq9GtR5ozAeq4ck2bC/YchHzmaaVfFWRF3dCauFwpfVfMjWAErg8OCOne
         VKUW6bToLXZur9/mANDLh/XaWPEhatE/fMCA8cjoTBUr/CgbC1XEuMCwopmNe0oQZ6
         a9FAlSAN9OtoSm2Eg4CN7Deh1rt4ro6PPDd4hWvGYWfPRma3yAnmBHeQTkPUF/VXIY
         ZAyRwbbgjALsLfvmTGjr3xQinQzljFuDWStTq4jeOvgvw90mO+Bv2fWTNQobr+h/3N
         twH9ho+NDDRWA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/13] kconfig: add long options --help and --silent
Date:   Sun, 14 Mar 2021 04:48:26 +0900
Message-Id: <20210313194836.372585-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210313194836.372585-1-masahiroy@kernel.org>
References: <20210313194836.372585-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

They are long options for -h and -s, respectively.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index dc1a67fd35a9..aac76acfd100 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -474,6 +474,8 @@ static void check_conf(struct menu *menu)
 }
 
 static struct option long_opts[] = {
+	{"help",          no_argument,       NULL,            'h'},
+	{"silent",        no_argument,       NULL,            's'},
 	{"oldaskconfig",  no_argument,       &input_mode_opt, oldaskconfig},
 	{"oldconfig",     no_argument,       &input_mode_opt, oldconfig},
 	{"syncconfig",    no_argument,       &input_mode_opt, syncconfig},
-- 
2.27.0

