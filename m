Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:42771 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759191AbdKOVfA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 16:35:00 -0500
Received: by mail-io0-f193.google.com with SMTP id u42so3084776ioi.9
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Nov 2017 13:35:00 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 10/18] arm64: add a workaround for GNU gold with ARM64_MODULE_PLTS
Date: Wed, 15 Nov 2017 13:34:20 -0800
Message-Id: <20171115213428.22559-11-samitolvanen@google.com>
In-Reply-To: <20171115213428.22559-1-samitolvanen@google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>
Cc: Sami Tolvanen <samitolvanen@google.com>

CONFIG_CLANG_LTO depends on GNU gold and due to a known bug, the
linker crashes when ARM64_MODULE_PLTS is enabled:

  https://sourceware.org/bugzilla/show_bug.cgi?id=14592

To work around the problem, this change removes NOLOAD from .plt
and .init.plt, which allows us to link modules with ld.gold.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/arm64/kernel/module.lds | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/module.lds b/arch/arm64/kernel/module.lds
index f7c9781a9d48..eacb5c67f61e 100644
--- a/arch/arm64/kernel/module.lds
+++ b/arch/arm64/kernel/module.lds
@@ -1,4 +1,4 @@
 SECTIONS {
-	.plt (NOLOAD) : { BYTE(0) }
-	.init.plt (NOLOAD) : { BYTE(0) }
+	.plt : { BYTE(0) }
+	.init.plt : { BYTE(0) }
 }
-- 
2.15.0.448.gf294e3d99a-goog

