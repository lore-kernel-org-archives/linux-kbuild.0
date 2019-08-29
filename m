Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35986 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfH2Jyx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Aug 2019 05:54:53 -0400
MIME-Version: 1.0
References: <20190828055425.24765-1-yamada.masahiro@socionext.com>
 <CAKwvOdmFjOMPW3_V+2ZnYFUyjWWuW2919cCk=ePn30f2szsi2g@mail.gmail.com> <CA+icZUWv0vAOSq_4BfbqrTdUSnN_D4ETVfpSHiATokCsY2R9pg@mail.gmail.com>
In-Reply-To: <CA+icZUWv0vAOSq_4BfbqrTdUSnN_D4ETVfpSHiATokCsY2R9pg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 29 Aug 2019 11:54:40 +0200
Message-ID: <CA+icZUXQYcX4+00JbOkZHaBDB=JEsabpU7HpZ_bTaV_gahr0ww@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: refactor scripts/Makefile.extrawarn
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <michal.lkml@markovi.net>, clang-built-linux <clang-built-linux@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>

> So, if it is desired to pass the CLANG extrawarn compiler-options to
> all W=... then I ask myself why the CLANG block is in the W=1 block
> only?
> So if CLANG extrawarn options are independent of any W=... make-option
> then I prefer to put it in a seperate block with an appropriate
> comment.
>

Maybe something like that (on top of the two patches I had sent).

From: Sedat Dilek <sedat.dilek@credativ.de>
Date: Thu, 29 Aug 2019 11:35:21 +0200
Subject: [PATCH 3/3] kbuild: Move extra warnings for Clang

---
 Documentation/kbuild/kbuild.rst |  5 +++--
 scripts/Makefile.extrawarn      | 21 ++++++++++-----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 3e65d32af875..fa9772ae2367 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -245,10 +245,11 @@ KBUILD_EXTRA_CC_CHECKS
 ------------------------------
 If enabled over the make command line with "W=...", it turns on additional
 compiler warning options like -Wmissing-declarations for more extensive
-build-time checking. For more details see <scripts/Makefile.extrawarn>.
+build-time checking.
+Some extra warning options are set for all W=... settings when using Clang.
+For more details see <scripts/Makefile.extrawarn>.

 W=1 - warnings that may be relevant and does not occur too often
-W=1 - also stops suppressing some warnings
 W=2 - warnings that occur quite often but may still be relevant
 W=3 - the more obscure warnings, can most likely be ignored

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 72677ee9f202..86c0f8ae7e35 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -5,6 +5,16 @@

 KBUILD_CFLAGS += $(call cc-disable-warning, packed-not-aligned)

+#
+# W=... - stops suppressing some warnings when using Clang
+#
+ifdef CONFIG_CC_IS_CLANG
+KBUILD_CFLAGS += -Wno-initializer-overrides
+KBUILD_CFLAGS += -Wno-format
+KBUILD_CFLAGS += -Wno-sign-compare
+KBUILD_CFLAGS += -Wno-format-zero-length
+endif
+
 ifeq ("$(origin W)", "command line")
   export KBUILD_EXTRA_CC_CHECKS := $(W)
 endif
@@ -30,17 +40,6 @@ KBUILD_CFLAGS += -Wno-sign-compare

 KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN1

-else
-
-# W=1 - also stops suppressing some warnings
-
-ifdef CONFIG_CC_IS_CLANG
-KBUILD_CFLAGS += -Wno-initializer-overrides
-KBUILD_CFLAGS += -Wno-format
-KBUILD_CFLAGS += -Wno-sign-compare
-KBUILD_CFLAGS += -Wno-format-zero-length
-endif
-
 endif

 #
-- 
2.20.1

- Sedat -
