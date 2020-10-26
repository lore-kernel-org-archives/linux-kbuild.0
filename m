Return-Path: <SRS0=c+w1=EB=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B79C4363A
	for <linux-kbuild@archiver.kernel.org>; Mon, 26 Oct 2020 22:03:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9347B2084C
	for <linux-kbuild@archiver.kernel.org>; Mon, 26 Oct 2020 22:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603749834;
	bh=mZA155bDOUr6xE6zOwjLW4uXm7Jxh/NAZ+oFR/xBspM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=tJ+ZC2vQcKU2wNoWYFAA3roTdccQAMOBlQbSFvzo3zz7n69ipXQvFL+2UB47UKzvK
	 41CCtCGlB1+kEroSrWnd2zH+OmGMKl7xihkwMfCMwHxsjqUtwjt6ORKU+J0x32msrL
	 E5pLTqAox842GWN0z1bT7xO04R4L79y+9zs2fJRY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391776AbgJZWDy (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 26 Oct 2020 18:03:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:57476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391763AbgJZWDx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Oct 2020 18:03:53 -0400
Received: from localhost.localdomain (unknown [192.30.34.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D5BF20706;
        Mon, 26 Oct 2020 22:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603749832;
        bh=mZA155bDOUr6xE6zOwjLW4uXm7Jxh/NAZ+oFR/xBspM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SOi3aCf7R2Q877PaaGvAQEYVlU4kW46/FX7+85kQQbasAyM7LG0YLn8VBiD394wHf
         MgRskRIgBsPawQZZ0QSXVci31gg91cO1i5TFNc8g20aElXBOBsJUqhkwOkkB90mqT6
         qJRw4c7p+m1D99VGc1pkliJyB5RXSMsHBz06T8ag=
From:   Arnd Bergmann <arnd@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH 2/2] Makefile.extrawarn: limit -Wnested-externs to clang
Date:   Mon, 26 Oct 2020 23:03:14 +0100
Message-Id: <20201026220331.3896226-2-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201026220331.3896226-1-arnd@kernel.org>
References: <20201026220331.3896226-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The -Wnested-externs warning has become useless with gcc, since
this warns every time that BUILD_BUG_ON() or similar macros
are used.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/Makefile.extrawarn | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 6baee1200615..9406f752e355 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -61,7 +61,10 @@ endif
 ifneq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
 
 KBUILD_CFLAGS += -Wdisabled-optimization
+ifdef CONFIG_CC_IS_CLANG
 KBUILD_CFLAGS += -Wnested-externs
+endif
+
 KBUILD_CFLAGS += -Wshadow
 KBUILD_CFLAGS += $(call cc-option, -Wlogical-op)
 KBUILD_CFLAGS += -Wmissing-field-initializers
-- 
2.27.0

