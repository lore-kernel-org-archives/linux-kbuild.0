Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E087FC433E6
	for <linux-kbuild@archiver.kernel.org>; Mon, 21 Dec 2020 07:04:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C3C522CB1
	for <linux-kbuild@archiver.kernel.org>; Mon, 21 Dec 2020 07:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgLUHEJ (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 21 Dec 2020 02:04:09 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:55944 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbgLUHEJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Dec 2020 02:04:09 -0500
Received: from grover.flets-west.jp (softbank126090214151.bbtec.net [126.90.214.151]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0BL72keO003020;
        Mon, 21 Dec 2020 16:02:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0BL72keO003020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608534166;
        bh=fEEvXp8Wcc12ooWYzUUnc13htwwx9AT0UT0HbIHCBzQ=;
        h=From:To:Cc:Subject:Date:From;
        b=YxQa/VUlK9andMBzmjR3xjfwYN1HmmVkqEwi/YIQrc5cfjrNMCncCePFSjI7MTlPS
         cNhK48prYFP5GN+Bn1K2XQFZORx9YjeoAwLPtRRkvn4Kvjd4eQPTbNUuWMdMPJsg6T
         cRLpzggF/xqEXwiEFPSBDnb6hwsu0VO1iTcIJcsyqeOWISf3OTBoGf1rTNx+EdJrEt
         Ww6mR7zLe4+ha4OtjXBthvX1080yYofa5AIhLnPvpcEvcfSFksgrwqfXLYuE52bpkh
         NppratIyZB3s28qMgwGKuOL8nEueK0Kwd3x8/eTxuvjIcOm50cvnM+0OQWbLiqhEnf
         6gy1pydJBDj2g==
X-Nifty-SrcIP: [126.90.214.151]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: doc: fix $(fileno) to $(filename)
Date:   Mon, 21 Dec 2020 16:02:34 +0900
Message-Id: <20201221070234.269173-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is a typo.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kconfig-macro-language.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/kconfig-macro-language.rst b/Documentation/kbuild/kconfig-macro-language.rst
index 8b413ef9603d..6163467f6ae4 100644
--- a/Documentation/kbuild/kconfig-macro-language.rst
+++ b/Documentation/kbuild/kconfig-macro-language.rst
@@ -97,7 +97,7 @@ Like Make, Kconfig provides several built-in functions. Every function takes a
 particular number of arguments.
 
 In Make, every built-in function takes at least one argument. Kconfig allows
-zero argument for built-in functions, such as $(fileno), $(lineno). You could
+zero argument for built-in functions, such as $(filename), $(lineno). You could
 consider those as "built-in variable", but it is just a matter of how we call
 it after all. Let's say "built-in function" here to refer to natively supported
 functionality.
-- 
2.27.0

