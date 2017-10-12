Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:26519 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750918AbdJLJ5e (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Oct 2017 05:57:34 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] kbuild: add stringify helper to quote a string passed to C files
Date: Thu, 12 Oct 2017 18:56:03 +0900
Message-Id: <1507802164-31614-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1507802164-31614-1-git-send-email-yamada.masahiro@socionext.com>
References: <1507802164-31614-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Joe Perches <joe@perches.com>, Tom Rini <trini@konsulko.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Kaehlcke <mka@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Arnd Bergmann <arnd@arndb.de>, James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Jan-Simon=20M=C3=B6ller?= <dl9pf@gmx.de>, Michal Marek <michal.lkml@markovi.net>, Douglas Anderson <dianders@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@kernel.org>, Mark Charlebois <charlebm@gmail.com>

I want to reuse $(squote)$(quote)...$(quote)$(squote) in the next
commit.  Move it to a helper.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 4 ++++
 scripts/Makefile.lib   | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index db81df3..0b97354 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -33,6 +33,10 @@ baseprereq = $(basename $(notdir $<))
 escsq = $(subst $(squote),'\$(squote)',$1)
 
 ###
+# Quote a string to pass it to C files. foo => '"foo"'
+stringify = $(squote)$(quote)$1$(quote)$(squote)
+
+###
 # Easy method for doing a status message
        kecho := :
  quiet_kecho := echo
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 580e605..9bbb019 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -89,7 +89,7 @@ obj-dirs	:= $(addprefix $(obj)/,$(obj-dirs))
 # Note: Files that end up in two or more modules are compiled without the
 #       KBUILD_MODNAME definition. The reason is that any made-up name would
 #       differ in different configs.
-name-fix = $(squote)$(quote)$(subst $(comma),_,$(subst -,_,$1))$(quote)$(squote)
+name-fix = $(call stringify,$(subst $(comma),_,$(subst -,_,$1)))
 basename_flags = -DKBUILD_BASENAME=$(call name-fix,$(basetarget))
 modname_flags  = $(if $(filter 1,$(words $(modname))),\
                  -DKBUILD_MODNAME=$(call name-fix,$(modname)))
-- 
2.7.4

