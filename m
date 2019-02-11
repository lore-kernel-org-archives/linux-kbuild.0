Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk1-f202.google.com ([209.85.221.202]:39856 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729872AbfBKTae (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Feb 2019 14:30:34 -0500
Received: by mail-vk1-f202.google.com with SMTP id k8so30403vke.6
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Feb 2019 11:30:34 -0800 (PST)
Date: Mon, 11 Feb 2019 11:30:03 -0800
Message-Id: <20190211193008.24101-1-ndesaulniers@google.com>
Mime-Version: 1.0
Subject: [PATCH v2 1/4] init/Kconfig: add config support for detecting linker
From: ndesaulniers@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: natechancellor@gmail.com, sedat.dilek@gmail.com, keescook@chromium.org, samitolvanen@google.com, michal.lkml@markovi.net, akpm@linux-foundation.org, hannes@cmpxchg.org, peterz@infradead.org, linux@dominikbrodowski.net, npiggin@gmail.com, mathieu.desnoyers@efficios.com, gor@linux.ibm.com, adrian@lisas.de, rgb@redhat.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>

Similar to how we differentiate between CONFIG_CC_IS_GCC and
CONFIG_CC_IS_CLANG, add CONFIG_LD_IS_BFD, CONFIG_LD_IS_GOLD, and
CONFIG_LD_IS_LLD.

This simiplifies patches to Makefiles that need to do different things
for different linkers.

Cc: Sami Tolvanen <samitolvanen@google.com>
Suggested-by: Sedat Dilek <sedat.dilek@gmail.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes V1->V2:
* Add suggested, reviewed, and tested by tags.

 init/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index c9386a365eea..b6046dcf7794 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -26,6 +26,15 @@ config CLANG_VERSION
 config CC_HAS_ASM_GOTO
 	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
 
+config LD_IS_BFD
+	def_bool $(success,$(LD) --version | head -n 1 | grep -q 'GNU ld')
+
+config LD_IS_GOLD
+	def_bool $(success,$(LD) --version | head -n 1 | grep -q 'GNU gold')
+
+config LD_IS_LLD
+	def_bool $(success,$(LD) --version | head -n 1 | grep -q 'LLD')
+
 config CONSTRUCTORS
 	bool
 	depends on !UML
-- 
2.20.1.791.gb4d0f1c61a-goog
