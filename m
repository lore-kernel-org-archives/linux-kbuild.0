Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:58419 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753064AbeBPSly (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 13:41:54 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 23/23] gcc-plugins: enable GCC_PLUGINS for COMPILE_TEST
Date: Sat, 17 Feb 2018 03:38:51 +0900
Message-Id: <1518806331-7101-24-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The plugin availability is checked in Kconfig, so all{yes,mod}config
will not be bothered.  Remove 'depends on !COMPILE_TEST'.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index d567bd1..5b5610b 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -415,7 +415,6 @@ menuconfig GCC_PLUGINS
 	bool "GCC plugins"
 	depends on HAVE_GCC_PLUGINS
 	depends on CC_HAS_GCC_PLUGINS
-	depends on !COMPILE_TEST
 	help
 	  GCC plugins are loadable modules that provide extra features to the
 	  compiler. They are useful for runtime instrumentation and static analysis.
-- 
2.7.4

