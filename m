Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:44616 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751862AbeC0FcA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 01:32:00 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 13/21] kconfig: add CC_IS_GCC and GCC_VERSION
Date: Tue, 27 Mar 2018 14:29:27 +0900
Message-Id: <1522128575-5326-14-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This will be useful to specify the required compiler version,
like this:

config FOO
        bool "Use Foo"
        depends on GCC_VERSION >= 408000
        help
          This feature requires GCC 4.8 or newer.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 init/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index c456030..923cab5 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -14,6 +14,14 @@ macro success $(shell ($(1) && echo y) || echo n)
 # expanded to y if the given compiler flag is supported, n otherwise
 macro cc-option $(success $CC -Werror $(1) -c -x c /dev/null -o /dev/null)
 
+config CC_IS_GCC
+	def_bool $(success $CC --version | grep -q gcc)
+
+config GCC_VERSION
+	int
+	default $(shell $srctree/scripts/gcc-version.sh -p $CC | sed 's/^0*//') if CC_IS_GCC
+	default 0
+
 config CONSTRUCTORS
 	bool
 	depends on !UML
-- 
2.7.4

