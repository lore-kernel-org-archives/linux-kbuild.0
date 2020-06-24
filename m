Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406600AbgFXUdg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 16:33:36 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C990C061797
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 13:33:35 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id p9so2445734qtn.5
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 13:33:35 -0700 (PDT)
Date: Wed, 24 Jun 2020 13:31:58 -0700
In-Reply-To: <20200624203200.78870-1-samitolvanen@google.com>
Message-Id: <20200624203200.78870-21-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200624203200.78870-1-samitolvanen@google.com>
Subject: [PATCH 20/22] x86, ftrace: disable recordmcount for ftrace_make_nop
From: Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Will Deacon <will@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Paul E. McKenney" <paulmck@kernel.org>, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org, Sami Tolvanen <samitolvanen@google.com>

Ignore mcount relocations in ftrace_make_nop.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/x86/kernel/ftrace.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 51504566b3a6..c3b28b81277b 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -121,6 +121,7 @@ ftrace_modify_code_direct(unsigned long ip, const char *old_code,
 	return 0;
 }
 
+__nomcount
 int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec, unsigned long addr)
 {
 	unsigned long ip = rec->ip;
-- 
2.27.0.212.ge8ba1cc988-goog
