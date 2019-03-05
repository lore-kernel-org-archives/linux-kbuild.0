Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:38923 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbfCEFvP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Mar 2019 00:51:15 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] objtool: move stack-validation.txt to Documentation/
Date: Tue,  5 Mar 2019 14:48:15 +0900
Message-Id: <1551764896-8453-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1551764896-8453-1-git-send-email-yamada.masahiro@socionext.com>
References: <1551764896-8453-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Douglas Anderson <dianders@chromium.org>, Robin Meijboom <robin@meijboom.info>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org

Move the document to the standard Documentation/ directory instead of
creating the same directory structure under objtool/.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 {tools/objtool/Documentation => Documentation}/stack-validation.txt | 0
 Documentation/x86/orc-unwinder.txt                                  | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename {tools/objtool/Documentation => Documentation}/stack-validation.txt (100%)

diff --git a/tools/objtool/Documentation/stack-validation.txt b/Documentation/stack-validation.txt
similarity index 100%
rename from tools/objtool/Documentation/stack-validation.txt
rename to Documentation/stack-validation.txt
diff --git a/Documentation/x86/orc-unwinder.txt b/Documentation/x86/orc-unwinder.txt
index cd4b29b..3aeff80 100644
--- a/Documentation/x86/orc-unwinder.txt
+++ b/Documentation/x86/orc-unwinder.txt
@@ -137,7 +137,7 @@ Unwinder implementation details
 
 Objtool generates the ORC data by integrating with the compile-time
 stack metadata validation feature, which is described in detail in
-tools/objtool/Documentation/stack-validation.txt.  After analyzing all
+Documentation/stack-validation.txt.  After analyzing all
 the code paths of a .o file, it creates an array of orc_entry structs,
 and a parallel array of instruction addresses associated with those
 structs, and writes them to the .orc_unwind and .orc_unwind_ip sections
-- 
2.7.4
