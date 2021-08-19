Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BB1C4338F
	for <linux-kbuild@archiver.kernel.org>; Thu, 19 Aug 2021 00:58:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12A25610E8
	for <linux-kbuild@archiver.kernel.org>; Thu, 19 Aug 2021 00:58:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234965AbhHSA7V (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 18 Aug 2021 20:59:21 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:60438 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234849AbhHSA7S (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 20:59:18 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 17J0vl4q017219;
        Thu, 19 Aug 2021 09:57:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 17J0vl4q017219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629334672;
        bh=6Gejaa7YZQrrpkNS/TloVBLSNqnj6Sl0GHlM3FPkJW0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=StqXUc+iWJIxnxyf1ckk1PYb49aLCe3E4xcKdQmP8jI5SMLkQJ/8V3UxHnsdr9Agh
         Sz2TwEJwYVBCXxdZyghpLXfyPMliCh/6ofWY8w0lUC0t5X47lkA2sYCZ5d9/7ULS4M
         NR9YDCXl70q+Pigp09WmfaCVmJEelvl2TvYQDuziL6s+sSVhD/YKryLiSUyhVdKibD
         1ykrwKVkMqwcpSGzzPqjFtb0nYBn/Zs7Vgk8fRI3TP3ZjJSj6KJWbCCFt/DaYl5n7j
         z2xIPECB7hqyZOOeNLc1za9ArBxTIrtW2Hve7yZT3By92ALFEpuPYG8uiPa1imsryU
         sdnvp6Q4bU5Ug==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 07/13] kbuild: do not remove 'linux' link in scripts/link-vmlinux.sh
Date:   Thu, 19 Aug 2021 09:57:38 +0900
Message-Id: <20210819005744.644908-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819005744.644908-1-masahiroy@kernel.org>
References: <20210819005744.644908-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

arch/um/Makefile passes the -f option to the ln command:

    $(Q)ln -f $< $@

So, the hard link is always re-created, and the old one is removed
anyway.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/link-vmlinux.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index a6c4d0bce3ba..7b9c62e4d54a 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -206,7 +206,6 @@ vmlinux_link()
 			-Wl,-T,${lds}				\
 			${objects}				\
 			-lutil -lrt -lpthread
-		rm -f linux
 	fi
 }
 
-- 
2.30.2

