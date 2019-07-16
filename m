Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([193.142.43.55]:50175 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbfGPMsC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 08:48:02 -0400
Date: Tue, 16 Jul 2019 14:47:56 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
Subject: kbuild: Fail if gold linker is detected
Message-ID: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org, "H.J. Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org

The gold linker has known issues of failing the build in random and
predictible ways. H.J. stated:

  "Since building a workable kernel for different kernel configurations
   isn't a requirement for gold, I don't recommend gold for kernel."

So instead of dealing with attempts to duct tape gold support without
understanding the root cause, fail the build when gold is detected.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Link: https://lore.kernel.org/r/CAMe9rOqMqkQ0LNpm25yE_Yt0FKp05WmHOrwc0aRDb53miFKM+w@mail.gmail.com
---
 scripts/Kconfig.include |    3 +++
 1 file changed, 3 insertions(+)

--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -35,5 +35,8 @@ ld-option = $(success,$(LD) -v $(1))
 $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
 $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
 
+# Fail if the linker is gold as it's not capable of linking the kernel proper
+$(error-if,$(success, command -v $(LD) -v | grep -q gold), gold linker '$(LD)' not supported)
+
 # gcc version including patch level
 gcc-version := $(shell,$(srctree)/scripts/gcc-version.sh $(CC))
