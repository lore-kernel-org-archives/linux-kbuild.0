Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B8EC43333
	for <linux-kbuild@archiver.kernel.org>; Wed,  3 Mar 2021 01:42:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C34EB64EA4
	for <linux-kbuild@archiver.kernel.org>; Wed,  3 Mar 2021 01:42:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237256AbhCCBcl (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 2 Mar 2021 20:32:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:36498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1448115AbhCBVHr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Mar 2021 16:07:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34B22614A7;
        Tue,  2 Mar 2021 21:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614719224;
        bh=DdFnIPNTmxwN8O44F3irsSvtEMs7VhI1V96hjPIjYec=;
        h=From:To:Cc:Subject:Date:From;
        b=i+BkJxO3Tdc3A3D8mOULNhtLfyRXzgDbtlEQDD16pca/FZnRaWAJ60CWRq109pP1s
         0dEgeH2Co0Sb0WoTwTOb8wkOJ4RE6YjzxM8MfUKCRt5aF2xC9T39nrQGhU6U2T0VHL
         dI2Wdovll3gqdQVJGck6DSL7mbiftK7uJUQn5N+sM5yoqR3AZ8R1auc56j+iseV4MA
         JSvGKO40C3GQZMKHtKvT9WVoaOW2aErIYpafF93DdQySuc0nCZtPMCF4kbZQrNpX+p
         /uvYkuBtLLWXNUggVnfq6cV/0/xDtnsComS0AZ+lKPu/KUv8xdBp1Qo/8CXMJIiQLI
         xwdiGEQYs7oDw==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 1/2] Makefile: Remove '--gcc-toolchain' flag
Date:   Tue,  2 Mar 2021 14:06:45 -0700
Message-Id: <20210302210646.3044738-1-nathan@kernel.org>
X-Mailer: git-send-email 2.31.0.rc0.75.gec125d1bc1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is not necessary anymore now that we specify '--prefix=', which
tells clang exactly where to find the GNU cross tools. This has been
verified with self compiled LLVM 10.0.1 and LLVM 13.0.0 as well as a
distribution version of LLVM 11.1.0 without binutils in the LLVM
toolchain locations.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Makefile b/Makefile
index f9b54da2fca0..c20f0ad8be73 100644
--- a/Makefile
+++ b/Makefile
@@ -568,10 +568,6 @@ ifneq ($(CROSS_COMPILE),)
 CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
 GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
 CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
-GCC_TOOLCHAIN	:= $(realpath $(GCC_TOOLCHAIN_DIR)/..)
-endif
-ifneq ($(GCC_TOOLCHAIN),)
-CLANG_FLAGS	+= --gcc-toolchain=$(GCC_TOOLCHAIN)
 endif
 ifneq ($(LLVM_IAS),1)
 CLANG_FLAGS	+= -no-integrated-as

base-commit: 7a7fd0de4a9804299793e564a555a49c1fc924cb
-- 
2.31.0.rc0.75.gec125d1bc1

