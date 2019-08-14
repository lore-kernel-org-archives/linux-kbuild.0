Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:52502 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbfHNKyf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Aug 2019 06:54:35 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] docs: kbuild: remove cc-ldoption from document again
Date: Wed, 14 Aug 2019 19:54:00 +0900
Message-Id: <20190814105400.1339-3-yamada.masahiro@socionext.com>
In-Reply-To: <20190814105400.1339-1-yamada.masahiro@socionext.com>
References: <20190814105400.1339-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Commit 055efab3120b ("kbuild: drop support for cc-ldoption") correctly
removed the cc-ldoption from Documentation/kbuild/makefiles.txt, but
commit cd238effefa2 ("docs: kbuild: convert docs to ReST and rename
to *.rst") revived it. I guess it was a rebase mistake.

Remove it again.

Fixes: cd238effefa2 ("docs: kbuild: convert docs to ReST and rename to *.rst")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/kbuild/makefiles.rst | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index b4c28c543d72..7971729d1fd4 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -471,21 +471,6 @@ more details, with real examples.
 	The second argument is optional, and if supplied will be used
 	if first argument is not supported.
 
-    cc-ldoption
-	cc-ldoption is used to check if $(CC) when used to link object files
-	supports the given option.  An optional second option may be
-	specified if first option are not supported.
-
-	Example::
-
-		#arch/x86/kernel/Makefile
-		vsyscall-flags += $(call cc-ldoption, -Wl$(comma)--hash-style=sysv)
-
-	In the above example, vsyscall-flags will be assigned the option
-	-Wl$(comma)--hash-style=sysv if it is supported by $(CC).
-	The second argument is optional, and if supplied will be used
-	if first argument is not supported.
-
     as-instr
 	as-instr checks if the assembler reports a specific instruction
 	and then outputs either option1 or option2
-- 
2.17.1
