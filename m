Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D8AC433FE
	for <linux-kbuild@archiver.kernel.org>; Thu, 29 Sep 2022 18:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234417AbiI2SOL (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 29 Sep 2022 14:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234024AbiI2SOK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Sep 2022 14:14:10 -0400
Received: from conuserg-07.nifty.com (conuserg-07.nifty.com [210.131.2.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80EE31F4963;
        Thu, 29 Sep 2022 11:14:09 -0700 (PDT)
Received: from zoe.. (133-32-182-133.west.xps.vectant.ne.jp [133.32.182.133]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 28TICSkv009916;
        Fri, 30 Sep 2022 03:12:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 28TICSkv009916
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1664475149;
        bh=/N85yOCsWCEX0gYKiIN6j0gQlvT6Zmx5QES3AFiJr2U=;
        h=From:To:Cc:Subject:Date:From;
        b=0Gj46DYGz21vO+suWpGp4MkBwHqTb4FEzSuWHV/J21EgycYV34eZQGMAkjUgFMOf9
         8eHKS8upXIiGxguZlNn7cX85bc5JxJImNuaL7lLxsE2lRvMip7isqyeGYcO7hXm5G2
         7z5TBs2Wmm2cJOA2FahSUH4NC+qrpzYXEblZd3CykFLlXt2zyFogl4nwcC6VANIB+S
         oH1UQFtihI5XY/pPYYOr1yHqNTzqDPyrU2ip2Qc1SGkzSWEoornqarBhxyyYAZY58F
         0C12deiH0Z0DanvEV6HtPKp23o9KG/gvLSyxxXRTtvJu87YSeNPoly3vx8oXTo3St9
         tWmlssaW3CF9Q==
X-Nifty-SrcIP: [133.32.182.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Subject: [PATCH] Revert "kbuild: Check if linker supports the -X option"
Date:   Fri, 30 Sep 2022 03:12:23 +0900
Message-Id: <20220929181223.2502994-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts commit d79a27195a33f4b5e591de5536799ad874ea6cf5.

According to the commit description, this ld-option test was added for
the gold linker at that time.

Commit 75959d44f9dc ("kbuild: Fail if gold linker is detected") gave
up the gold linker support after all.

I tested the BFD linker from binutils 2.23 and LLD from LLVM 11.0.0.
Both of them support the -X option.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 49dcae886c48..d7c85ec79000 100644
--- a/Makefile
+++ b/Makefile
@@ -1037,7 +1037,7 @@ KBUILD_LDFLAGS	+= $(call ld-option,--no-warn-rwx-segments)
 endif
 
 ifeq ($(CONFIG_STRIP_ASM_SYMS),y)
-LDFLAGS_vmlinux	+= $(call ld-option, -X,)
+LDFLAGS_vmlinux	+= -X
 endif
 
 ifeq ($(CONFIG_RELR),y)
-- 
2.34.1

