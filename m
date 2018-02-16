Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:57772 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752659AbeBPSlS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 13:41:18 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 09/23] kconfig: add 'cc-option' macro
Date: Sat, 17 Feb 2018 03:38:37 +0900
Message-Id: <1518806331-7101-10-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This will be the most frequently used macro.  It evaluates to 'y' if
the given argument is supported by the compiler, or 'n' otherwise.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 init/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index b4814e6..f026a62 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -8,6 +8,10 @@ config DEFCONFIG_LIST
 	default ARCH_DEFCONFIG
 	default "arch/$ARCH/defconfig"
 
+config cc-option
+	string
+	macro $(shell $CC -Werror $(1) -c -x c /dev/null -o /dev/null)
+
 config CONSTRUCTORS
 	bool
 	depends on !UML
-- 
2.7.4

