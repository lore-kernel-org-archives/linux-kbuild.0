Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:57737 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbeHHG0x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Aug 2018 02:26:53 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RESEND PATCH] init/Kconfig: Use short unix-style option instead of --longname
Date: Wed,  8 Aug 2018 13:06:43 +0900
Message-Id: <1533701203-31019-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Rob Landley <rob@landley.net>, Ulf Magnusson <ulfalizer@gmail.com>, Jiri Kosina <trivial@kernel.org>, Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

From: Rob Landley <rob@landley.net>

Avoids warning messages with the latest release of toybox, which never
bothered to implement the --longopts nothing was using.

Signed-off-by: Rob Landley <rob@landley.net>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

This was sent to the trivial ML some time ago,
but not applied yet.

I will apply this to kbuild tree for v4.19

[yamada.masahiro@socionext.com
 Move the patch description under '---'
 to the commit log body.
]


 init/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 794a1b1..944b1fd 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2,9 +2,9 @@ config DEFCONFIG_LIST
 	string
 	depends on !UML
 	option defconfig_list
-	default "/lib/modules/$(shell,uname --release)/.config"
+	default "/lib/modules/$(shell,uname -r)/.config"
 	default "/etc/kernel-config"
-	default "/boot/config-$(shell,uname --release)"
+	default "/boot/config-$(shell,uname -r)"
 	default ARCH_DEFCONFIG
 	default "arch/$(ARCH)/defconfig"
 
-- 
2.7.4

