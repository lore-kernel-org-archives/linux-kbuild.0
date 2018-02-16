Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:49045 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751109AbeBPVmW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 16:42:22 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/3] Kconfig: disable PROFILE_ALL_BRANCHES for compile testing
Date: Fri, 16 Feb 2018 22:41:11 +0100
Message-Id: <20180216214117.1947175-2-arnd@arndb.de>
In-Reply-To: <20180216214117.1947175-1-arnd@arndb.de>
References: <20180216214117.1947175-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>

This can easily double the time for compiling a driver but does not
provide any benefit for the compile tester, so it's better left disabled.

In addition, any 'inline' function that is not also 'static' and that
contains an 'if' causes a warning like

include/linux/string.h:212:2: note: in expansion of macro 'if'
  if (strscpy(p, q, p_size < q_size ? p_size : q_size) < 0)
  ^~
include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'strcpy' which is not static

without this patch, and I could not come up with a nice fix for that.
In combination with my patch to always enable 'CONFIG_COMPILE_TEST'
during 'randconfig' builds, we can at least hide these warnings for
most users.

Cc: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 kernel/trace/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 434c840e2d82..faaf687b13b1 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -345,6 +345,7 @@ config PROFILE_ANNOTATED_BRANCHES
 config PROFILE_ALL_BRANCHES
 	bool "Profile all if conditionals"
 	select TRACE_BRANCH_PROFILING
+	depends on !COMPILE_TEST
 	help
 	  This tracer profiles all branch conditions. Every if ()
 	  taken in the kernel is recorded whether it hit or miss.
-- 
2.9.0

