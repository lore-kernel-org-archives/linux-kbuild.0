Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A91C11F69
	for <linux-kbuild@archiver.kernel.org>; Wed, 30 Jun 2021 12:14:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 550B561624
	for <linux-kbuild@archiver.kernel.org>; Wed, 30 Jun 2021 12:14:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234446AbhF3MR0 (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 30 Jun 2021 08:17:26 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:43462 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234388AbhF3MRZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Jun 2021 08:17:25 -0400
X-UUID: 16c61951859943f39f6e4523d853573e-20210630
X-UUID: 16c61951859943f39f6e4523d853573e-20210630
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1114671309; Wed, 30 Jun 2021 20:14:54 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 20:14:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 20:14:52 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <keescook@chromium.org>, <samitolvanen@google.com>,
        <linux-kbuild@vger.kernel.org>
CC:     <clang-built-linux@googlegroups.com>,
        <linux-kernel@vger.kernel.org>, <yj.chiang@mediatek.com>,
        <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>
Subject: [PATCH 2/2] Kbuild: lto: add make version checking
Date:   Wed, 30 Jun 2021 20:14:36 +0800
Message-ID: <20210630121436.19581-3-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210630121436.19581-1-lecopzer.chen@mediatek.com>
References: <20210630121436.19581-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

LTO with MODVERSION will fail in generating correct CRC because
the makefile rule doesn't work for make with version 3.8X.[1]

Thus we need to check make version during selecting on LTO Kconfig.
and the suitable version should be 4.2(40200) which release in 2016[2].

[1] https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/
[2] https://ftp.gnu.org/gnu/make/
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 arch/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index c45b770d3579..1571957bade5 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -632,6 +632,7 @@ config HAS_LTO_CLANG
 	def_bool y
 	# Clang >= 11: https://github.com/ClangBuiltLinux/linux/issues/510
 	depends on CC_IS_CLANG && CLANG_VERSION >= 110000 && LD_IS_LLD && AS_IS_LLVM
+	depends on MAKE_VERSION_INT >= 40200
 	depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
 	depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
 	depends on ARCH_SUPPORTS_LTO_CLANG
-- 
2.18.0

