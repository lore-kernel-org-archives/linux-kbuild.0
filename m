Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC64C4361B
	for <linux-kbuild@archiver.kernel.org>; Sat, 19 Dec 2020 18:20:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 689D322D74
	for <linux-kbuild@archiver.kernel.org>; Sat, 19 Dec 2020 18:20:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbgLSSUD (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 19 Dec 2020 13:20:03 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:51190 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgLSSUD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Dec 2020 13:20:03 -0500
Received: from localhost.localdomain (softbank126090214151.bbtec.net [126.90.214.151]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 0BJIIhEV028815;
        Sun, 20 Dec 2020 03:18:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 0BJIIhEV028815
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608401924;
        bh=e6qPy+YG7dYZrKoEmX4k3IHv2jDogsg6ZSVDKuXRsUo=;
        h=From:To:Cc:Subject:Date:From;
        b=vFlMFF/Kuekhl7G98TelzAPTnBcKX4325+ydFmMqUQiTrcerNir386jXDyLsHWQBm
         BJdxqiJD/OjcBGxTgfqYiz6b+n+AXSRNb8vsM0v9ylAbngBTesmeskpCvgXJUKlAEo
         Cj0o0Izr4SW26YviZvtCgiEORZoz4v1Xhk5cccpLhqk4Ydu2O9+r4O8wmMl5lSsubZ
         +x+ccPxf/+SF/1aBP58+YSVPGgeX1CyPuTyqQBT+NZwmMRXYiLHF8mDxQ3yFhMhSsR
         /rCZkwkDNdGANvwPd1C2ZBj78kY8V++M+niwXiNAi+/dRG5KNciFvVttCUmxEz8/W+
         KfUvtc/cuQYAQ==
X-Nifty-SrcIP: [126.90.214.151]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: fix return value of do_error_if()
Date:   Sun, 20 Dec 2020 03:18:42 +0900
Message-Id: <20201219181842.178250-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Kconfig expands a macro to a string. $(error-if,...) should be expanded
to an empty string, not NULL.

Fixes: 1d6272e6fe43 ("kconfig: add 'info', 'warning-if', and 'error-if' built-in functions")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/preprocess.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
index 0243086fb168..0590f86df6e4 100644
--- a/scripts/kconfig/preprocess.c
+++ b/scripts/kconfig/preprocess.c
@@ -114,7 +114,7 @@ static char *do_error_if(int argc, char *argv[])
 	if (!strcmp(argv[0], "y"))
 		pperror("%s", argv[1]);
 
-	return NULL;
+	return xstrdup("");
 }
 
 static char *do_filename(int argc, char *argv[])
-- 
2.27.0

