Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:45593 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbfLFNDd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Dec 2019 08:03:33 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/2] mkcompile_h: use printf for LINUX_COMPILE_BY
Date: Fri,  6 Dec 2019 22:03:02 +0900
Message-Id: <20191206130302.11473-2-masahiroy@kernel.org>
In-Reply-To: <20191206130302.11473-1-masahiroy@kernel.org>
References: <20191206130302.11473-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Commit 858805b336be ("kbuild: add $(BASH) to run scripts with
bash-extension") shed light on portability issues. Here is another one.

Since commit f07726048d59 ("Fix handling of backlash character in
LINUX_COMPILE_BY name"), we must escape a backslash contained in
LINUX_COMPILE_BY. This is not working on distros like Ubuntu.

As the POSIX spec [1] says, if any of the operands contain a backslash
( '\' ) character, the results are implementation-defined.

The actual shell of /bin/sh could be bash, dash depending on distros,
and the behavior of builtin echo command is different among them.

The bash builtin echo, unless -e is given, copies the arguments to
output without expanding escape sequences (BSD-like behavior).

The dash builtin echo, in contrast, adopts System V behavior, which
does expand escape sequences without any option.

Even non-builtin /bin/echo behaves differently depending on the system.
Due to these variations, echo is considered as a non-portable command.
Using printf is the common solution to avoid the portability issue.

[1] https://pubs.opengroup.org/onlinepubs/009695399/utilities/echo.html

Fixes: 858805b336be ("kbuild: add $(BASH) to run scripts with bash-extension")
Reported-by: XXing Wei <xxing.wei@unisoc.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mkcompile_h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index 3097fec1756a..3a5a4b210c86 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -69,7 +69,7 @@ UTS_VERSION="$(echo $UTS_VERSION $CONFIG_FLAGS $TIMESTAMP | cut -b -$UTS_LEN)"
 
   echo \#define UTS_VERSION \"$UTS_VERSION\"
 
-  echo \#define LINUX_COMPILE_BY \"$LINUX_COMPILE_BY\"
+  printf '#define LINUX_COMPILE_BY "%s"\n' "$LINUX_COMPILE_BY"
   echo \#define LINUX_COMPILE_HOST \"$LINUX_COMPILE_HOST\"
 
   echo \#define LINUX_COMPILER \"`$CC -v 2>&1 | grep ' version ' | sed 's/[[:space:]]*$//'`\"
-- 
2.17.1
