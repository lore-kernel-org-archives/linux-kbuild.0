Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EE9C4320A
	for <linux-kbuild@archiver.kernel.org>; Fri, 30 Jul 2021 20:17:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 228CD61074
	for <linux-kbuild@archiver.kernel.org>; Fri, 30 Jul 2021 20:17:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbhG3URS (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 30 Jul 2021 16:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbhG3URQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Jul 2021 16:17:16 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1889AC0613CF
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 13:17:11 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id y25-20020ac870990000b02902536d2bea0fso2091829qto.19
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 13:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bdaJ+2ov+VGokTpwDiU9B4WCnxMwARVW0/jkGqItkL4=;
        b=ba2SFUQKtzWx/58l/55eeBKV35/AZvblErwEGcbZGZlsLojN9JeqV6Tw8kAKE6qlG2
         ym8ry/iMK4HE0KbVB0A2VTaYK/kZXBK/3RPsrjgOiTsN0j++SXbSohQ0Eho6V+ZfYs/f
         gFCMdQXg4mvgXqDlVusy6BnT5JLJkbe83rrZwbBS3BaycGSKk+8w4SO/Gxb7G+5tpvqk
         hCD4IuahkkfI8iUegm7RwEkgVF2Pqgul1F4FaubIOWMFVAG2BtnOtearby3X15o2KFTx
         y3Et+Ov2U06hVw41XujKKNSW+xZo94Q6wSvgdFX1szA31prIlHwixCRmeYFOkzWD1wRh
         L6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bdaJ+2ov+VGokTpwDiU9B4WCnxMwARVW0/jkGqItkL4=;
        b=KRZIbWlgFO3uoVEl8wRRNmC4OJIo7iv8qcgdK2fjGd7by2UDAGRoj+n5x7/Qng7Xv3
         AO6LdhUtSQp6uzBAbuzh/Ofwk7D4nx+/xk2QdrJ0AvA3eUfeVTpopIj8mAcTFkzOondC
         9P2gr2Vcj35NS4G2BkLS9DuNTeoOTgKRXihNhkgoApKgv4zLEkjQ0wYHph1RplpPuCDO
         thaSJ4PrPeww4qk244RjCJX7L8vFVPZopaIFqZHQdrApzVBtFjXDbAso3xs9y0aYzt6b
         5SlDv5B6CbbRbarZTjhrLGDbw8M7dqvx6O+CZuFLg7/3Q1chB34K3DUHAvAxoem/IB2l
         HoeA==
X-Gm-Message-State: AOAM530lmq2q3+uFADzEVaa7zTEbxNHNsxHMIgAFIh3eFujtc6kAk+dO
        T3UCFw1qPtKZH4TrNgrq/v5d5UObezRvao28k00=
X-Google-Smtp-Source: ABdhPJye6o8W8X7eDFzsZhDjFMznUBlbpeE7wFvMJfhzqXwDIp1dphJO4tLOAXueCXTC3nUrvzUBHN4BGAw3p2QzwlQ=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:ca8b:b433:7c1d:90d])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:134c:: with SMTP id
 b12mr3056998qvw.39.1627676230194; Fri, 30 Jul 2021 13:17:10 -0700 (PDT)
Date:   Fri, 30 Jul 2021 13:17:01 -0700
In-Reply-To: <20210730201701.3146910-1-ndesaulniers@google.com>
Message-Id: <20210730201701.3146910-3-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210730201701.3146910-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v4 2/2] Documentation/llvm: update CROSS_COMPILE inferencing
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As noted by Masahiro, document how we can generally infer CROSS_COMPILE
(and the more specific details about --target and --prefix) based on
ARCH.

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Note: Masahiro, I'm sorry for putting my name on this as you mostly
wrote it. I touched it up slightly.  I don't know how best to attribute
it to you. If you'd prefer to take back authorship, please do; I'd
rather not add your SOB without seeing it stated explicitly.

 Documentation/kbuild/llvm.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index b18401d2ba82..4292f0686316 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -63,6 +63,23 @@ They can be enabled individually. The full list of the parameters: ::
 Currently, the integrated assembler is disabled by default. You can pass
 ``LLVM_IAS=1`` to enable it.
 
+Omitting CROSS_COMPILE
+----------------------
+
+As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
+
+Unless ``LLVM_IAS=1`` is specified, ``CROSS_COMPILE`` is also used to derive
+``--prefix=<path>`` to search for the GNU assembler.
+
+If ``CROSS_COMPILE`` is not specified, the ``--target=<triple>`` is inferred
+from ``ARCH``.
+
+That means if you use only LLVM tools, ``CROSS_COMPILE`` becomes unnecessary.
+
+For example, to cross-compile the arm64 kernel::
+
+	ARCH=arm64 make LLVM=1 LLVM_IAS=1
+
 Supported Architectures
 -----------------------
 
-- 
2.32.0.554.ge1b32706d8-goog

