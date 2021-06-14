Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4BEC48BE8
	for <linux-kbuild@archiver.kernel.org>; Mon, 14 Jun 2021 05:51:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A730D613C3
	for <linux-kbuild@archiver.kernel.org>; Mon, 14 Jun 2021 05:51:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbhFNFx1 (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 14 Jun 2021 01:53:27 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:46377 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232276AbhFNFx0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jun 2021 01:53:26 -0400
X-UUID: ee7ddcb7ec4b43a3a4cfb9ccec489cc4-20210614
X-UUID: ee7ddcb7ec4b43a3a4cfb9ccec489cc4-20210614
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1636646899; Mon, 14 Jun 2021 13:51:17 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Jun 2021 13:51:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Jun 2021 13:51:15 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        <nathan@kernel.org>, <ndesaulniers@google.com>,
        <keescook@chromium.org>, <samitolvanen@google.com>
CC:     <linux-kbuild@vger.kernel.org>,
        <clang-built-linux@googlegroups.com>,
        <linux-kernel@vger.kernel.org>, <yj.chiang@mediatek.com>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>
Subject: [PATCH] kbuild: lto: fix module versionings mismatch in incremental build
Date:   Mon, 14 Jun 2021 13:51:09 +0800
Message-ID: <20210614055109.28774-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When building modules(CONFIG_...=m), I found some of module versions
are incorrect and set to 0.
This can be found in build log for first clean build which shows

WARNING: EXPORT symbol "XXXX" [drivers/XXX/XXX.ko] version generation failed, symbol will not be versioned.

But in second build(incremental build), the WARNING disappeared and the
module version becomes valid CRC and make someone who want to change
modules without updating kernel image can't insert their modules.

The problematic code is
+	$(foreach n, $(filter-out FORCE,$^),				\
+		$(if $(wildcard $(n).symversions),			\
+			; cat $(n).symversions >> $@.symversions))

For example:
  rm -f fs/notify/built-in.a.symversions    ; rm -f fs/notify/built-in.a; \
llvm-ar cDPrST fs/notify/built-in.a fs/notify/fsnotify.o \
fs/notify/notification.o fs/notify/group.o ...

`foreach n` shows nothing to `cat` into $(n).symversions because
`if $(wildcard $(n).symversions)` return nothing, but actually
they do exist during this line was executed.

-rw-r--r-- 1 root root 168580 Jun 13 19:10 fs/notify/fsnotify.o
-rw-r--r-- 1 root root    111 Jun 13 19:10 fs/notify/fsnotify.o.symversions

The reason is the $(n).symversions are generated at runtime, but
Makefile wildcard function expends and checks the file exist or not
during parsing the Makefile.

Thus fix this by use `test` shell command to check the file
existence in runtime.

Fixes: 38e89184900385 ("kbuild: lto: fix module versioning")
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 scripts/Makefile.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 949f723efe53..a91012b06ebb 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -387,8 +387,7 @@ ifeq ($(CONFIG_LTO_CLANG) $(CONFIG_MODVERSIONS),y y)
       cmd_update_lto_symversions =					\
 	rm -f $@.symversions						\
 	$(foreach n, $(filter-out FORCE,$^),				\
-		$(if $(wildcard $(n).symversions),			\
-			; cat $(n).symversions >> $@.symversions))
+			; test -s $(n).symversions && cat $(n).symversions >> $@.symversions)
 else
       cmd_update_lto_symversions = echo >/dev/null
 endif
-- 
2.18.0

