Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:44594 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751824AbeC0FcA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 01:32:00 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 10/21] kconfig: add 'success' and 'cc-option' macros
Date: Tue, 27 Mar 2018 14:29:24 +0900
Message-Id: <1522128575-5326-11-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

'cc-option' will be the most frequently used macro.  It evaluates to 'y'
if the given argument is supported by the compiler, or 'n' otherwise.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Implement 'success' as a macro

 init/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 0d6fe20..c456030 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -8,6 +8,12 @@ config DEFCONFIG_LIST
 	default ARCH_DEFCONFIG
 	default "arch/$ARCH/defconfig"
 
+# expanded to y if the command exits with 0, n otherwise
+macro success $(shell ($(1) && echo y) || echo n)
+
+# expanded to y if the given compiler flag is supported, n otherwise
+macro cc-option $(success $CC -Werror $(1) -c -x c /dev/null -o /dev/null)
+
 config CONSTRUCTORS
 	bool
 	depends on !UML
-- 
2.7.4

