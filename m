Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98499C433EF
	for <linux-kbuild@archiver.kernel.org>; Mon, 28 Mar 2022 15:08:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242023AbiC1PJp (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 28 Mar 2022 11:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238206AbiC1PJn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Mar 2022 11:09:43 -0400
Received: from conuserg-10.nifty.com (conuserg-10.nifty.com [210.131.2.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15685F8CC;
        Mon, 28 Mar 2022 08:08:02 -0700 (PDT)
Received: from grover.. (133-32-176-37.west.xps.vectant.ne.jp [133.32.176.37]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 22SF7L0W004279;
        Tue, 29 Mar 2022 00:07:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 22SF7L0W004279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1648480041;
        bh=ISTtvjUDXjLP9uSMSA+wgYZumpK7DOq5dgiQQSeSIqE=;
        h=From:To:Cc:Subject:Date:From;
        b=KoasDRFT+Y9OH4RDffPN8+zEsxOIaWcbUWh0+/ZgJ5K+Zp9g3FI5rmqtmDp7p5IfL
         KP2zn9fh5nl1iMa1HZZbglvYL9FKZKMALpoQQX1zxiwMm6n3J0EwwtqxCPJhtofU3F
         RNSBwxVDeeixYfuPdJhSpcQ/FLZ0QNCmtB0rxah3GcOu3BJs+Yn1hop+MelDiNOxEK
         uIRDXzzyWroEMhsgyerHPsHjDgBrfbafAaieKWjpoqj6xnIiFV2pT23lxq9EPhqr3S
         9WM67f+ykjd9c9jAdaj0TJ0wqu70ilVp+14I+BSvpRSPA0W8QobOnHOFxrcoXQpb7M
         pJiqkIOsmTQ0g==
X-Nifty-SrcIP: [133.32.176.37]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: remove stale comment about removed kconfig_print_symbol()
Date:   Tue, 29 Mar 2022 00:07:10 +0900
Message-Id: <20220328150710.162368-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This comment is about kconfig_print_symbol(), which was removed by
commit 6ce45a91a982 ("kconfig: refactor conf_write_symbol()").

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 0c711a1bdc96..00f93c03aa57 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -658,13 +658,6 @@ static char *escape_string_value(const char *in)
 	return out;
 }
 
-/*
- * Kconfig configuration printer
- *
- * This printer is used when generating the resulting configuration after
- * kconfig invocation and `defconfig' files. Unset symbol might be omitted by
- * passing a non-NULL argument to the printer.
- */
 static void __print_symbol(FILE *fp, struct symbol *sym, bool output_n,
 			   bool escape_string)
 {
-- 
2.32.0

