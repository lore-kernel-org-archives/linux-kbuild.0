Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F5BC4320A
	for <linux-kbuild@archiver.kernel.org>; Tue, 31 Aug 2021 07:40:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE7CB60F46
	for <linux-kbuild@archiver.kernel.org>; Tue, 31 Aug 2021 07:40:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239986AbhHaHlh (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 31 Aug 2021 03:41:37 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:65503 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239957AbhHaHlh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 03:41:37 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 17V7e8Ea031407;
        Tue, 31 Aug 2021 16:40:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 17V7e8Ea031407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630395614;
        bh=Mo8jpYXlZfuZ/0/Dqq3Nmx/iu12GS/XpVojzXtd5bjM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JPu8XRBl3gFsOmhG4dLq9Vj8pp195A82L1B3q/d+Db4RGIAI8SDegj5QHoS0K0e++
         nItjEoM2f7+DdY5Dgt8A6uQYlk1x7gL/k8uj/+vm3Dp+Z4Tb44IdBUyFT5AhxSgR0D
         vU2G/TWCwI10vur1OjIUeED3TWxKpeSz5TnhJ2RdPFhOcoQtSLttmSmBhsY9B/cOvz
         zrU+TxVvOCc0639WxNNc0fT7YVBVMm74iTJoSbv7xY4rIpa6uYC1ZcuBXPg/0k0M87
         B8iV0xjpTZzCG6uozjRVtlxJsJN34U8O2/Ar6aX1xdO1BmLss+qUDlpOpq993LAsaD
         +cY9LTkd8UMSg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/13] kbuild: add cmd_and_savecmd macro
Date:   Tue, 31 Aug 2021 16:40:00 +0900
Message-Id: <20210831074004.3195284-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210831074004.3195284-1-masahiroy@kernel.org>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Separate out the command execution part of if_changed, as we did
for if_changed_dep.

This allows us to reuse it in if_changed_rule.

  define rule_foo
          $(call cmd_and_savecmd,foo)
          $(call cmd,bar)
  endef

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Kbuild.include | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index cdec22088423..d09fc14205a0 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -138,9 +138,11 @@ check-FORCE = $(if $(filter FORCE, $^),,$(warning FORCE prerequisite is missing)
 if-changed-cond = $(newer-prereqs)$(cmd-check)$(check-FORCE)
 
 # Execute command if command has changed or prerequisite(s) are updated.
-if_changed = $(if $(if-changed-cond),                                        \
+if_changed = $(if $(if-changed-cond),$(cmd_and_savecmd),@:)
+
+cmd_and_savecmd =                                                            \
 	$(cmd);                                                              \
-	printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
+	printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd
 
 # Execute the command and also postprocess generated .d dependencies file.
 if_changed_dep = $(if $(if-changed-cond),$(cmd_and_fixdep),@:)
-- 
2.30.2

